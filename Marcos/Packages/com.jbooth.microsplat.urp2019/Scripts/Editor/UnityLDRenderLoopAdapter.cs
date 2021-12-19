//////////////////////////////////////////////////////
// MicroSplat
// Copyright (c) Jason Booth
//////////////////////////////////////////////////////

using UnityEngine;
using UnityEditor;
using System.Text;
using System.Linq;

namespace JBooth.MicroSplat
{
   public class UnityLDRenderLoopAdapter : IRenderLoopAdapter
   {
      public string GetDisplayName()
      {
         return "URP";
      }

      public string GetShaderExtension() { return "shader"; }

      public string GetRenderLoopKeyword()
      {
         return "_MSRENDERLOOP_UNITYLD";
      }

      public string GetVersion()
      {
         return "3.8";
      }

      MicroSplatGenerator gen;

      TextAsset templateURP;
      TextAsset templateInclude;
      TextAsset templatePassDepthOnly;
      TextAsset templatePassForward;
      TextAsset templatePassMeta;
      TextAsset templatePass2D;
      TextAsset templatePassShadow;
      TextAsset templateShared;
      TextAsset templateVert;
      TextAsset templateChain;
      TextAsset templateShaderDesc;
      TextAsset templateTess;


      public void Init(string[] paths)
      {
         if (gen == null)
         {
            gen = new MicroSplatGenerator();
         }
         gen.Init(paths);

         for (int i = 0; i < paths.Length; ++i)
         {
            string p = paths[i];
            if (p.EndsWith("microsplat_template_urp2019_template.txt"))
            {
               templateURP = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_func_tess2.txt"))
            {
               templateTess = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_shaderdesc.txt"))
            {
               templateShaderDesc = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_chain.txt"))
            {
               templateChain = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_urp2019_pass2d.txt"))
            {
               templatePass2D = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_urp2019_passforward.txt"))
            {
               templatePassForward = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_urp2019_passdepthonly.txt"))
            {
               templatePassDepthOnly = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_urp2019_passmeta.txt"))
            {
               templatePassMeta = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_urp2019_passshadows.txt"))
            {
               templatePassShadow = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_shared.txt"))
            {
               templateShared = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_urp2019_vert.txt"))
            {
               templateVert = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }
            else if (p.EndsWith("microsplat_template_urp2019_include.txt"))
            {
               templateInclude = AssetDatabase.LoadAssetAtPath<TextAsset>(p);
            }

         }

         if (templateURP == null || templateInclude == null || templateShared == null || templateVert == null
            || templatePassForward == null || templateChain == null)
         {
            Debug.LogError ("URP Template files not found, will not be able to compile shaders");
         }
      }

      StringBuilder BuildTemplate(Blocks blocks, string fallbackOverride = null)
      {

         var template = new StringBuilder(100000);
         template.Append(templateURP.text);

         var passforward = new StringBuilder(templatePassForward.text);
         var passShadow = new StringBuilder(templatePassShadow.text);
         var passMeta = new StringBuilder(templatePassMeta.text);
         var passDepthOnly = new StringBuilder(templatePassDepthOnly.text);
         var vert = new StringBuilder(templateVert.text);
         var urpInclude = new StringBuilder(templateInclude.text);

         if (blocks.options.Contains("Unlit"))
         {
            //passGBuffer.Clear();
         }

         if (blocks.options.Contains("Alpha \"Blend\""))
         {
            passDepthOnly.Length = 0;
            passShadow.Length = 0;
            passforward = passforward.Replace("%FORWARDBASEBLEND%", "Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha\nCull Back\n ZTest LEqual\nZWrite Off");
            blocks.defines += "\n#define _ALPHABLEND_ON 1\n#define _SURFACE_TYPE_TRANSPARENT 1\n";
            passforward = passforward.Insert(0, "\nZWrite Off ColorMask RGB\n\n");
         }
         else
         {
            passforward = passforward.Replace("%FORWARDBASEBLEND%", "");
         }

         template = template.Replace("%PASSMETA%", passMeta.ToString());
         template = template.Replace("%PASSFORWARD%", passforward.ToString());
         template = template.Replace("%PASS2D%", templatePass2D.text);
         template = template.Replace("%PASSDEPTHONLY%", passDepthOnly.ToString());
         template = template.Replace("%PASSSHADOW%", passShadow.ToString());
         template = template.Replace("%URPINCLUDE%", urpInclude.ToString());
         template = template.Replace("%VERT%", vert.ToString());
         template = template.Replace("%SHADERDESC%", templateShaderDesc.text + templateChain.text);
         template = template.Replace("%URPINCLUDE%", templateInclude.ToString());


         StringBuilder header = new StringBuilder();
         header.AppendLine("////////////////////////////////////////");
         header.AppendLine("// MicroSplat");
         header.AppendLine("// Copyright (c) Jason Booth");
         header.AppendLine("//");
         header.AppendLine("// Auto-generated shader code, don't hand edit!");
         header.AppendLine("//");
         header.AppendLine("//   Unity Version: " + Application.unityVersion);
         header.AppendLine("//   Render Pipeline: URP2019");
         header.AppendLine("//   Platform: " + Application.platform);
         header.AppendLine("////////////////////////////////////////\n\n");

         template = template.Insert(0, header);

         string tags = SurfaceShaderRenderLoopAdapter.GetTags(blocks.options);
         if (tags != null)
         {
            tags = tags.Replace("\"RenderType\"", "\"RenderPipeline\" = \"UniversalPipeline\"  \"RenderType\"");
            tags = tags.Replace("Opaque", "HDLitShader");

         }
         else
         {
            tags = "\"RenderPipeline\"=\"UniversalPipeline\"  \"RenderType\" = \"HDLitShader\" \"Queue\" = \"Geometry\"";
            
            if (blocks.options.Contains("Alpha"))
            {
               tags = tags.Replace("Geometry", "Transparent");
            }
         }


         template = template.Replace("%TAGS%", tags);



         template = template.Replace("%TEMPLATE_SHARED%", templateShared.text);
         template = SurfaceShaderRenderLoopAdapter.ReplaceOrRemove(template, "%CUSTOMEDITOR%", "CustomEditor", SurfaceShaderRenderLoopAdapter.GetOption(blocks.options, "CustomEditor"));
         if (fallbackOverride != null)
         {
            template = template.Replace("%FALLBACK%", "Fallback \"" + fallbackOverride + "\"");
            template = SurfaceShaderRenderLoopAdapter.ReplaceOrRemove(template, "%DEPENDENCY%", "Dependency \"BaseMapShader\" = ", fallbackOverride);
         }
         else
         {
            template = SurfaceShaderRenderLoopAdapter.ReplaceOrRemove(template, "%FALLBACK%", "Fallback", "");
            template = SurfaceShaderRenderLoopAdapter.ReplaceOrRemove(template, "%DEPENDENCY%", "Dependency", "");
         }
         return template;
      }

      public StringBuilder WriteShader(string[] features,
            MicroSplatShaderGUI.MicroSplatCompiler compiler,
            MicroSplatShaderGUI.MicroSplatCompiler.AuxShader auxShader,
            string name,
            string baseName)
      {
         StringBuilder defines = new StringBuilder();
         var blocks = gen.GetShaderBlocks(features, compiler, auxShader);

         var shader = BuildTemplate(blocks, baseName);
         defines.AppendLine(blocks.defines);
         defines.AppendLine("\n   #define _URP 1");


         string shaderTarget = "3.5";
         if (features.Contains("_TESSDISTANCE") || features.Contains("_FORCEMODEL46"))
         {
            shaderTarget = "4.6";
         }
         else if (features.Contains("_FORCEMODEL50"))
         {
            shaderTarget = "5.0";
         }

         if (features.Contains("_TESSDISTANCE"))
         {
            defines.AppendLine("\n      #define _TESSELLATION_ON 1");
            shader = shader.Replace("%TESSELLATION%", templateTess.text);
            shader = shader.Replace("%PRAGMAS%", "   #pragma hull Hull\n   #pragma domain Domain\n   #pragma vertex TessVert\n   #pragma fragment Frag\n   #pragma require tesshw\n");
         }
         else
         {
            shader = shader.Replace("%PRAGMAS%", "   #pragma vertex Vert\n   #pragma fragment Frag");
            shader = shader.Replace("%TESSELLATION%", "");
         }
         shader = shader.Replace("%SHADERTARGET%", shaderTarget);
         if (features.Contains("_USESPECULARWORKFLOW"))
         {
            defines.AppendLine("\n#define _USESPECULAR 1");
            defines.AppendLine("#define _MATERIAL_FEATURE_SPECULAR_COLOR 1");
         }

         defines.AppendLine();

         shader = shader.Replace("%SHADERNAME%", name);
         shader = shader.Replace("%PROPERTIES%", blocks.properties);
         shader = shader.Replace("%CODE%", blocks.code);
         shader = shader.Replace("%DEFINES%", defines.ToString());
         shader = shader.Replace("%CBUFFER%", blocks.cbuffer);
         string codeNoComments = blocks.code.StripComments();

         shader = SurfaceShaderRenderLoopAdapter.Strip(codeNoComments, shader);

         // standard pipeline stuff
         shader = shader.Replace("fixed", "half");
         shader = shader.Replace("unity_ObjectToWorld", "GetObjectToWorldMatrix()");
         shader = shader.Replace("unity_WorldToObject", "GetWorldToObjectMatrix()");

         shader = shader.Replace("UNITY_MATRIX_M", "GetObjectToWorldMatrix()");
         shader = shader.Replace("UNITY_MATRIX_I_M", "GetWorldToObjectMatrix()");
         shader = shader.Replace("UNITY_MATRIX_VP", "GetWorldToHClipMatrix()");
         shader = shader.Replace("UNITY_MATRIX_V", "GetWorldToViewMatrix()");
         shader = shader.Replace("UNITY_MATRIX_P", "GetViewToHClipMatrix()");

         return shader;
      }

      
   }
}
