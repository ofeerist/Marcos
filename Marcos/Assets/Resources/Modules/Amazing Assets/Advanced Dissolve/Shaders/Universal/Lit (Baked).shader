Shader "Amazing Assets/Advanced Dissolve/Baked/Lit (Baked)"
{
    Properties
    {
        // Specular vs Metallic workflow
        [HideInInspector] _WorkflowMode("WorkflowMode", Float) = 1.0

        [MainColor] _BaseColor("Color", Color) = (1,1,1,1)
        [MainTexture] _BaseMap("Albedo", 2D) = "white" {}

        _Cutoff("Alpha Cutoff", Range(0.0, 1.0)) = 0.5

        _Smoothness("Smoothness", Range(0.0, 1.0)) = 0.5
        _GlossMapScale("Smoothness Scale", Range(0.0, 1.0)) = 1.0
        _SmoothnessTextureChannel("Smoothness texture channel", Float) = 0

        _Metallic("Metallic", Range(0.0, 1.0)) = 0.0
        _MetallicGlossMap("Metallic", 2D) = "white" {}

        _SpecColor("Specular", Color) = (0.2, 0.2, 0.2)
        _SpecGlossMap("Specular", 2D) = "white" {}

        [ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
        [ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0

        _BumpScale("Scale", Float) = 1.0
        _BumpMap("Normal Map", 2D) = "bump" {}

        _OcclusionStrength("Strength", Range(0.0, 1.0)) = 1.0
        _OcclusionMap("Occlusion", 2D) = "white" {}

        _EmissionColor("Color", Color) = (0,0,0)
        _EmissionMap("Emission", 2D) = "white" {}

        // Blending state
        [HideInInspector] _Surface("__surface", Float) = 0.0
        [HideInInspector] _Blend("__blend", Float) = 0.0
        [HideInInspector] _AlphaClip("__clip", Float) = 0.0
        [HideInInspector] _SrcBlend("__src", Float) = 1.0
        [HideInInspector] _DstBlend("__dst", Float) = 0.0
        [HideInInspector] _ZWrite("__zw", Float) = 1.0
        [HideInInspector] _Cull("__cull", Float) = 2.0

        _ReceiveShadows("Receive Shadows", Float) = 1.0
        // Editmode props
        [HideInInspector] _QueueOffset("Queue offset", Float) = 0.0

        // ObsoleteProperties
        [HideInInspector] _MainTex("BaseMap", 2D) = "white" {}
        [HideInInspector] _Color("Base Color", Color) = (1, 1, 1, 1)
        [HideInInspector] _GlossMapScale("Smoothness", Float) = 0.0
        [HideInInspector] _Glossiness("Smoothness", Float) = 0.0
        [HideInInspector] _GlossyReflections("EnvironmentReflections", Float) = 0.0




//Advanced Dissolve Properties Start////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Cutout
[HideInInspector]                                                   _AdvancedDissolveCutoutStandardClip("", Range(0,1)) = 0.5

[HideInInspector]											        _AdvancedDissolveCutoutStandardMap1("", 2D) = "white" { }
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap1Tiling("", Vector) = (1, 1, 1, 0)
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap1Offset("", Vector) = (0, 0, 0, 0)
[HideInInspector]					                                _AdvancedDissolveCutoutStandardMap1Scroll("", Vector) = (0, 0, 0, 0)
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap1Intensity("", Range(0, 1)) = 1
[HideInInspector][Enum(Red, 0, Green, 1, Blue, 2, Alpha, 3)]        _AdvancedDissolveCutoutStandardMap1Channel("", INT) = 3
[HideInInspector][AdvancedDissolveToggleFloat]				        _AdvancedDissolveCutoutStandardMap1Invert("", INT) = 0
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap2("", 2D) = "white" { }
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap2Tiling("", Vector) = (1, 1, 1, 0)
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap2Offset("", Vector) = (0, 0, 0, 0)
[HideInInspector]					                                _AdvancedDissolveCutoutStandardMap2Scroll("", Vector) = (0, 0, 0, 0)
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap2Intensity("", Range(0, 1)) = 1
[HideInInspector][Enum(Red, 0, Green, 1, Blue, 2, Alpha, 3)]        _AdvancedDissolveCutoutStandardMap2Channel("", INT) = 3
[HideInInspector][AdvancedDissolveToggleFloat]				        _AdvancedDissolveCutoutStandardMap2Invert("", INT) = 0
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap3("", 2D) = "white" { }
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap3Tiling("", Vector) = (1, 1, 1, 0)
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap3Offset("", Vector) = (0, 0, 0, 0)
[HideInInspector]					                                _AdvancedDissolveCutoutStandardMap3Scroll("", Vector) = (0, 0, 0, 0)
[HideInInspector]											        _AdvancedDissolveCutoutStandardMap3Intensity("", Range(0, 1)) = 1
[HideInInspector][Enum(Red, 0, Green, 1, Blue, 2, Alpha, 3)]        _AdvancedDissolveCutoutStandardMap3Channel("", INT) = 3
[HideInInspector][AdvancedDissolveToggleFloat]				        _AdvancedDissolveCutoutStandardMap3Invert("", INT) = 0

[HideInInspector][Enum(Multiply, 0, Add, 1)]				        _AdvancedDissolveCutoutStandardMapsBlendType("", Float) = 0
[HideInInspector][Enum(World, 0, Local, 1)]					        _AdvancedDissolveCutoutStandardMapsTriplanarMappingSpace("", Float) = 0	
[HideInInspector][Enum(Constant, 0, Camera Relative, 1)]            _AdvancedDissolveCutoutStandardMapsScreenSpaceUVScale("", Float) = 0
[HideInInspector][AdvancedDissolveToggleFloat]				        _AdvancedDissolveCutoutStandardBaseInvert("", INT) = 0

//Geometric
[HideInInspector][AdvancedDissolveToggleFloat]			    	    _AdvancedDissolveCutoutGeometricInvert("", Float) = 0
[HideInInspector]										    	    _AdvancedDissolveCutoutGeometricNoise("", Float) = 0.1	

[HideInInspector][Enum(X, 0, Y, 1, Z, 2)]                           _AdvancedDissolveCutoutGeometricXYZAxis("", Float) = 0
[HideInInspector][Enum(Linear, 0, Symmetrical, 1)]                  _AdvancedDissolveCutoutGeometricXYZStyle("", Float) = 0 
[HideInInspector][Enum(World, 0, Local, 1)]                         _AdvancedDissolveCutoutGeometricXYZSpace("", Float) = 0	 
[HideInInspector]											        _AdvancedDissolveCutoutGeometricXYZRollout("", Float) = 0
[HideInInspector]											        _AdvancedDissolveCutoutGeometricXYZPosition("", Vector) = (0, 0, 0, 0)

[HideInInspector]										    	    _AdvancedDissolveCutoutGeometric1Position("", Vector) = (0,0,0,0)
[HideInInspector]										    	    _AdvancedDissolveCutoutGeometric1Normal("", Vector) = (1,0,0,0)
[HideInInspector]										    	    _AdvancedDissolveCutoutGeometric1Radius("", Float) = 1
[HideInInspector]										    	    _AdvancedDissolveCutoutGeometric1Height("", Float) = 1

[HideInInspector]										    	    _AdvancedDissolveCutoutGeometric2Position("", Vector) = (0,0,0,0)
[HideInInspector]									    		    _AdvancedDissolveCutoutGeometric2Normal("", Vector) = (1,0,0,0)
[HideInInspector]									    		    _AdvancedDissolveCutoutGeometric2Radius("", Float) = 1
[HideInInspector]									    		    _AdvancedDissolveCutoutGeometric2Height("", Float) = 1
 
[HideInInspector]									    		    _AdvancedDissolveCutoutGeometric3Position("", Vector) = (0,0,0,0)
[HideInInspector]									    		    _AdvancedDissolveCutoutGeometric3Normal("", Vector) = (1,0,0,0)
[HideInInspector]									    		    _AdvancedDissolveCutoutGeometric3Radius("", Float) = 1
[HideInInspector]										    	    _AdvancedDissolveCutoutGeometric3Height("", Float) = 1

[HideInInspector]										    	    _AdvancedDissolveCutoutGeometric4Position("", Vector) = (0,0,0,0)
[HideInInspector]											        _AdvancedDissolveCutoutGeometric4Normal("", Vector) = (1,0,0,0)
[HideInInspector]											        _AdvancedDissolveCutoutGeometric4Radius("", Float) = 1
[HideInInspector]											        _AdvancedDissolveCutoutGeometric4Height("", Float) = 1

//Edge
[HideInInspector]										    	    _AdvancedDissolveEdgeBaseWidthStandard("", Range(0,1)) = 0.1 
[HideInInspector]										    	    _AdvancedDissolveEdgeBaseWidthGeometric("", Range(0,1)) = 0.1 
[HideInInspector][Enum(Solid, 0, Smooth, 1, Smoother, 2)]           _AdvancedDissolveEdgeBaseShape("", INT) = 0
[HideInInspector][AdvancedDissolveColorRGB]  				        _AdvancedDissolveEdgeBaseColor("", Color) = (0,1,0,1)
[HideInInspector]											        _AdvancedDissolveEdgeBaseColorTransparency("", Range(0, 1)) = 1
[HideInInspector][AdvancedDissolveExponental]                       _AdvancedDissolveEdgeBaseColorIntensity("", Vector) = (0, 0, 0, 0)		

[HideInInspector][AdvancedDissolveColorRGB]					        _AdvancedDissolveEdgeAdditionalColor("", color) = (1, 0, 0, 1)
[HideInInspector]											        _AdvancedDissolveEdgeAdditionalColorTransparency("", Range(0, 1)) = 1
[HideInInspector][AdvancedDissolveExponental]			            _AdvancedDissolveEdgeAdditionalColorIntensity("", Vector) = (0, 0, 0, 0)
[HideInInspector]								                    _AdvancedDissolveEdgeAdditionalColorMap("", 2D) = "white" { }
[HideInInspector]					                                _AdvancedDissolveEdgeAdditionalColorMapTiling("", Vector) = (1, 1, 1, 0)
[HideInInspector]					                                _AdvancedDissolveEdgeAdditionalColorMapOffset("", Vector) = (0, 0, 0, 0)
[HideInInspector]					                                _AdvancedDissolveEdgeAdditionalColorMapScroll("", Vector) = (0, 0, 0, 0)
[HideInInspector][AdvancedDissolveToggleFloat]				        _AdvancedDissolveEdgeAdditionalColorMapReverse("", FLOAT) = 0
[HideInInspector]											        _AdvancedDissolveEdgeAdditionalColorMapMipmap("", Range(0, 10)) = 1	
[HideInInspector]											        _AdvancedDissolveEdgeAdditionalColorPhaseOffset("", FLOAT) = 0
[HideInInspector]											        _AdvancedDissolveEdgeAdditionalColorAlphaOffset("", Range(-1, 1)) = 0	
[HideInInspector][AdvancedDissolveToggleFloat]				        _AdvancedDissolveEdgeAdditionalColorClipInterpolation("", Float) = 0


[HideInInspector]								                    _AdvancedDissolveEdgeUVDistortionMap("", 2D) = "black" { }
[HideInInspector]					                                _AdvancedDissolveEdgeUVDistortionMapTiling("", Vector) = (1, 1, 1, 0)
[HideInInspector]					                                _AdvancedDissolveEdgeUVDistortionMapOffset("", Vector) = (0, 0, 0, 0)
[HideInInspector]					                                _AdvancedDissolveEdgeUVDistortionMapScroll("", Vector) = (0, 0, 0, 0)
[HideInInspector]				                                    _AdvancedDissolveEdgeUVDistortionStrength("", Float) = 0

[HideInInspector][AdvancedDissolvePositiveFloat]			        _AdvancedDissolveEdgeGIMetaPassMultiplier("", Float) = 1

//Keywords
[HideInInspector][AdvancedDissolveKeywordState]                     _AdvancedDissolveKeywordState("", INT) = 0
[HideInInspector][AdvancedDissolveKeywordCutoutStandardSource]      _AdvancedDissolveKeywordCutoutStandardSource("", INT) = 0
[HideInInspector][AdvancedDissolveKeywordCutoutStandardMappingType] _AdvancedDissolveKeywordCutoutStandardSourceMapsMappingType("", INT) = 0
[HideInInspector][AdvancedDissolveKeywordCutoutGeometricType]       _AdvancedDissolveKeywordCutoutGeometricType("", INT) = 0
[HideInInspector][AdvancedDissolveKeywordCutoutGeometricCount]      _AdvancedDissolveKeywordCutoutGeometricCount("", INT) = 0
[HideInInspector][AdvancedDissolveKeywordEdgeBaseSource]            _AdvancedDissolveKeywordEdgeBaseSource("", INT) = 0
[HideInInspector][AdvancedDissolveKeywordEdgeAdditionalColorSource] _AdvancedDissolveKeywordEdgeAdditionalColorSource("", INT) = 0
[HideInInspector][AdvancedDissolveKeywordEdgeUVDistortionSource]    _AdvancedDissolveKeywordEdgeUVDistortionSource("", INT) = 0
[HideInInspector][AdvancedDissolveKeywordGlobalControlID]           _AdvancedDissolveKeywordGlobalControlID("", INT) = 0

//BakedKeywords
[HideInInspector]                                                   _AdvancedDissolveBakedKeywords("1,3,0,0,0,1,3,0,0", Vector) = (0,0,0,0)

//Advanced Dissolve Properties End////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    }

    SubShader
    {
        // Universal Pipeline tag is required. If Universal render pipeline is not set in the graphics settings
        // this Subshader will fail. One can add a subshader below or fallback to Standard built-in to make this
        // material work with both Universal Render Pipeline and Builtin Unity Pipeline
        Tags{"RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline" "IgnoreProjector" = "True"}
        LOD 300

        // ------------------------------------------------------------------
        //  Forward pass. Shades all light in a single pass. GI + emission + Fog
        Pass
        {
            // Lightmode matches the ShaderPassName set in UniversalRenderPipeline.cs. SRPDefaultUnlit and passes with
            // no LightMode tag are also rendered by Universal Render Pipeline
            Name "ForwardLit"
            Tags{"LightMode" = "UniversalForward"}

            Blend[_SrcBlend][_DstBlend]
            ZWrite[_ZWrite]
            Cull[_Cull]

            HLSLPROGRAM
            // Required to compile gles 2.0 with standard SRP library
            // All shaders must be compiled with HLSLcc and currently only gles is not using HLSLcc by default
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma target 2.0

            // -------------------------------------
            // Material Keywords
            #pragma shader_feature _NORMALMAP
            #pragma shader_feature _ALPHATEST_ON
            #pragma shader_feature _ALPHAPREMULTIPLY_ON
            #pragma shader_feature _EMISSION
            #pragma shader_feature _METALLICSPECGLOSSMAP
            #pragma shader_feature _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
            #pragma shader_feature _OCCLUSIONMAP

            #pragma shader_feature _SPECULARHIGHLIGHTS_OFF
            #pragma shader_feature _ENVIRONMENTREFLECTIONS_OFF
            #pragma shader_feature _SPECULAR_SETUP
            #pragma shader_feature _RECEIVE_SHADOWS_OFF

            // -------------------------------------
            // Universal Pipeline keywords
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
            #pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
            #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
            #pragma multi_compile _ _SHADOWS_SOFT
            #pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE

            // -------------------------------------
            // Unity defined keywords
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile_fog

            //--------------------------------------
            // GPU Instancing
            #pragma multi_compile_instancing

            #pragma vertex LitPassVertex
            #pragma fragment LitPassFragment

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"


//Advanced Dissolve Keywords Start///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define _ADVANCED_DISSOLVE_KEYWORDS_BAKED

#pragma shader_feature_local _AD_STATE_ENABLED
#define                      _AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS
#define                      _AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_DEFAULT
#define                      _AD_CUTOUT_GEOMETRIC_TYPE_NONE
#define                      _AD_CUTOUT_GEOMETRIC_COUNT_ONE
#define                      _AD_EDGE_BASE_SOURCE_CUTOUT_STANDARD
#define                      _AD_EDGE_ADDITIONAL_COLOR_GRADIENT_MAP
#define                      _AD_EDGE_UV_DISTORTION_SOURCE_DEFAULT
#define                      _AD_GLOBAL_CONTROL_ID_NONE
//Advanced Dissolve Keywords End/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


#define ADVANCED_DISSOLVE_UNIVERSAL_RENDER_PIPELINE
#include "../cginc/Defines.cginc"
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            CBUFFER_START(UnityPerMaterial)



//Cutout/////////////////////////////////////////////////////////////////////////////////////
#if !defined(_AD_CUTOUT_STANDARD_SOURCE_NONE)

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardClip)	

	#if defined(_AD_CUTOUT_STANDARD_SOURCE_CUSTOM_MAP) || defined(_AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS) || defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
		DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap1)		
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap1Invert)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Tiling)
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Offset)
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Scroll)										
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap1Intensity)										
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap1Channel)	


		#if defined(_AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_TRIPLANAR)
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMapsTriplanarMappingSpace)
		#elif defined(_AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_SCREEN_SPACE)
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMapsScreenSpaceUVScale)	
		#endif


		#if defined(_AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS) || defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap2)       
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap2Invert)
	
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Tiling)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Offset)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Scroll)							
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap2Intensity)										
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap2Channel)		
	

			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMapsBlendType)	
		#endif

		#if defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap3)   
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap3Invert)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Tiling)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Offset)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Scroll)								
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap3Intensity)										
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap3Channel)					                    
		#endif  

	#else
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardBaseInvert)		
	#endif

#endif


//Geometric/////////////////////////////////////////////////////////////////////////////////
#if defined(ADVANCED_DISSOLVE_CUTOUT_GEOMETRIC_ENABLED)

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricNoise)
	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricInvert)	
	

	#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_XYZ)
			
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZAxis)		
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutGeometricXYZStyle)		
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZSpace)					
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZRollout)		
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometricXYZPosition)					

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)		
		
	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)		

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Height)	

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Height)	

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Size)				
		DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric1MatrixTRS)					

	#endif



	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_TWO) || defined (_AD_CUTOUT_GEOMETRIC_COUNT_THREE) || defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)

		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE) 

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)		
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Height)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Height)	
		
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric2MatrixTRS)				

		#endif	
		
	#endif	//Two

	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_THREE) || defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)
	
		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)	
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Height)

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Height)

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric3MatrixTRS)				

		#endif

	#endif	//Three

	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)
	
		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)			
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Height)		

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Height)		

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric4MatrixTRS)				

		#endif

	#endif	//Four

#endif


//Edge///////////////////////////////////////////////////////////////////////////////////////
#if !defined(_AD_EDGE_BASE_SOURCE_NONE)

	#if defined(_AD_EDGE_BASE_SOURCE_CUTOUT_STANDARD) || defined(_AD_EDGE_BASE_SOURCE_ALL)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseWidthStandard)		
	#endif

	#if defined(_AD_EDGE_BASE_SOURCE_CUTOUT_GEOMETRIC) || defined(_AD_EDGE_BASE_SOURCE_ALL)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseWidthGeometric)		
	#endif

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseShape)	
	DISSOLVE_PROP_FLOAT4(_AdvancedDissolveEdgeBaseColor)					
	DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeBaseColorIntensity)
	DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseColorTransparency)


	//Additional Color///////////////////////////////////////////////////////////////////////////
	#if defined(_AD_EDGE_ADDITIONAL_COLOR_BASE_COLOR)

		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_CUSTOM_MAP)
	
		DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeAdditionalColorMap)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapTiling)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapOffset)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapScroll)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorMapMipmap)

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_GRADIENT_MAP)

		DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeAdditionalColorMap)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapTiling)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapOffset)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapScroll)

		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorMapReverse)		
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorClipInterpolation)	

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_GRADIENT_COLOR)

		DISSOLVE_PROP_FLOAT4(_AdvancedDissolveEdgeAdditionalColor)	
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorIntensity)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorTransparency)	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorPhaseOffset)	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorClipInterpolation)		

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_USER_DEFINED)
	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

	#endif

	//UV Distortion//////////////////////////////////////////////////////////////////////////////
	#if !defined(ADVANCED_DISSOLVE_SHADER_GRAPH)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeUVDistortionStrength)	

		#if defined(_AD_EDGE_UV_DISTORTION_SOURCE_CUSTOM_MAP)
			DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeUVDistortionMap)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapTiling)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapOffset)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapScroll)
		#endif
	#endif


	//GI/////////////////////////////////////////////////////////////////////////////////////////
	#if defined(ADVANCED_DISSOLVE_META_PASS)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeGIMetaPassMultiplier)				
	#endif

#endif


            float4 _BaseMap_ST;
            half4 _BaseColor;
            half4 _SpecColor;
            half4 _EmissionColor;
            half _Cutoff;
            half _Smoothness;
            half _Metallic;
            half _BumpScale;
            half _OcclusionStrength;
            CBUFFER_END


//Advanced Dissolve/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "../cginc/Core.cginc"


            #include "AdvancedDissolveLitInput.hlsl"
            #include "AdvancedDissolveLitForwardPass.hlsl"
            ENDHLSL
        }

        Pass
        {
            Name "ShadowCaster"
            Tags{"LightMode" = "ShadowCaster"}

            ZWrite On
            ZTest LEqual
            Cull[_Cull]

            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma target 2.0

            // -------------------------------------
            // Material Keywords
            #pragma shader_feature _ALPHATEST_ON

            //--------------------------------------
            // GPU Instancing
            #pragma multi_compile_instancing
            #pragma shader_feature _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

            #pragma vertex ShadowPassVertex
            #pragma fragment ShadowPassFragment

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"


//Advanced Dissolve Keywords Start///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define _ADVANCED_DISSOLVE_KEYWORDS_BAKED

#pragma shader_feature_local _AD_STATE_ENABLED
#define                      _AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS
#define                      _AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_DEFAULT
#define                      _AD_CUTOUT_GEOMETRIC_TYPE_NONE
#define                      _AD_CUTOUT_GEOMETRIC_COUNT_ONE
#define                      _AD_EDGE_BASE_SOURCE_CUTOUT_STANDARD
#define                      _AD_EDGE_ADDITIONAL_COLOR_GRADIENT_MAP
#define                      _AD_EDGE_UV_DISTORTION_SOURCE_DEFAULT
#define                      _AD_GLOBAL_CONTROL_ID_NONE
//Advanced Dissolve Keywords End/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


#define ADVANCED_DISSOLVE_UNIVERSAL_RENDER_PIPELINE
#include "../cginc/Defines.cginc"
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            CBUFFER_START(UnityPerMaterial)



//Cutout/////////////////////////////////////////////////////////////////////////////////////
#if !defined(_AD_CUTOUT_STANDARD_SOURCE_NONE)

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardClip)	

	#if defined(_AD_CUTOUT_STANDARD_SOURCE_CUSTOM_MAP) || defined(_AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS) || defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
		DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap1)		
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap1Invert)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Tiling)
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Offset)
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Scroll)										
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap1Intensity)										
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap1Channel)	


		#if defined(_AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_TRIPLANAR)
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMapsTriplanarMappingSpace)
		#elif defined(_AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_SCREEN_SPACE)
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMapsScreenSpaceUVScale)	
		#endif


		#if defined(_AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS) || defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap2)       
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap2Invert)
	
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Tiling)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Offset)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Scroll)							
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap2Intensity)										
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap2Channel)		
	

			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMapsBlendType)	
		#endif

		#if defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap3)   
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap3Invert)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Tiling)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Offset)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Scroll)								
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap3Intensity)										
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap3Channel)					                    
		#endif  

	#else
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardBaseInvert)		
	#endif

#endif


//Geometric/////////////////////////////////////////////////////////////////////////////////
#if defined(ADVANCED_DISSOLVE_CUTOUT_GEOMETRIC_ENABLED)

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricNoise)
	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricInvert)	
	

	#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_XYZ)
			
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZAxis)		
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutGeometricXYZStyle)		
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZSpace)					
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZRollout)		
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometricXYZPosition)					

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)		
		
	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)		

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Height)	

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Height)	

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Size)				
		DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric1MatrixTRS)					

	#endif



	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_TWO) || defined (_AD_CUTOUT_GEOMETRIC_COUNT_THREE) || defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)

		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE) 

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)		
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Height)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Height)	
		
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric2MatrixTRS)				

		#endif	
		
	#endif	//Two

	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_THREE) || defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)
	
		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)	
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Height)

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Height)

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric3MatrixTRS)				

		#endif

	#endif	//Three

	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)
	
		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)			
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Height)		

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Height)		

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric4MatrixTRS)				

		#endif

	#endif	//Four

#endif


//Edge///////////////////////////////////////////////////////////////////////////////////////
#if !defined(_AD_EDGE_BASE_SOURCE_NONE)

	#if defined(_AD_EDGE_BASE_SOURCE_CUTOUT_STANDARD) || defined(_AD_EDGE_BASE_SOURCE_ALL)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseWidthStandard)		
	#endif

	#if defined(_AD_EDGE_BASE_SOURCE_CUTOUT_GEOMETRIC) || defined(_AD_EDGE_BASE_SOURCE_ALL)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseWidthGeometric)		
	#endif

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseShape)	
	DISSOLVE_PROP_FLOAT4(_AdvancedDissolveEdgeBaseColor)					
	DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeBaseColorIntensity)
	DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseColorTransparency)


	//Additional Color///////////////////////////////////////////////////////////////////////////
	#if defined(_AD_EDGE_ADDITIONAL_COLOR_BASE_COLOR)

		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_CUSTOM_MAP)
	
		DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeAdditionalColorMap)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapTiling)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapOffset)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapScroll)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorMapMipmap)

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_GRADIENT_MAP)

		DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeAdditionalColorMap)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapTiling)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapOffset)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapScroll)

		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorMapReverse)		
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorClipInterpolation)	

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_GRADIENT_COLOR)

		DISSOLVE_PROP_FLOAT4(_AdvancedDissolveEdgeAdditionalColor)	
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorIntensity)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorTransparency)	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorPhaseOffset)	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorClipInterpolation)		

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_USER_DEFINED)
	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

	#endif

	//UV Distortion//////////////////////////////////////////////////////////////////////////////
	#if !defined(ADVANCED_DISSOLVE_SHADER_GRAPH)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeUVDistortionStrength)	

		#if defined(_AD_EDGE_UV_DISTORTION_SOURCE_CUSTOM_MAP)
			DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeUVDistortionMap)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapTiling)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapOffset)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapScroll)
		#endif
	#endif


	//GI/////////////////////////////////////////////////////////////////////////////////////////
	#if defined(ADVANCED_DISSOLVE_META_PASS)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeGIMetaPassMultiplier)				
	#endif

#endif


            float4 _BaseMap_ST;
            half4 _BaseColor;
            half4 _SpecColor;
            half4 _EmissionColor;
            half _Cutoff;
            half _Smoothness;
            half _Metallic;
            half _BumpScale;
            half _OcclusionStrength;
            CBUFFER_END


//Advanced Dissolve/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "../cginc/Core.cginc"


            #include "AdvancedDissolveLitInput.hlsl"
            #include "AdvancedDissolveShadowCasterPass.hlsl"
            ENDHLSL
        }

        Pass
        {
            Name "DepthOnly"
            Tags{"LightMode" = "DepthOnly"}

            ZWrite On
            ColorMask 0
            Cull[_Cull]

            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma target 2.0

            #pragma vertex DepthOnlyVertex
            #pragma fragment DepthOnlyFragment

            // -------------------------------------
            // Material Keywords
            #pragma shader_feature _ALPHATEST_ON
            #pragma shader_feature _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

            //--------------------------------------
            // GPU Instancing
            #pragma multi_compile_instancing

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"


//Advanced Dissolve Keywords Start///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define _ADVANCED_DISSOLVE_KEYWORDS_BAKED

#pragma shader_feature_local _AD_STATE_ENABLED
#define                      _AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS
#define                      _AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_DEFAULT
#define                      _AD_CUTOUT_GEOMETRIC_TYPE_NONE
#define                      _AD_CUTOUT_GEOMETRIC_COUNT_ONE
#define                      _AD_EDGE_BASE_SOURCE_CUTOUT_STANDARD
#define                      _AD_EDGE_ADDITIONAL_COLOR_GRADIENT_MAP
#define                      _AD_EDGE_UV_DISTORTION_SOURCE_DEFAULT
#define                      _AD_GLOBAL_CONTROL_ID_NONE
//Advanced Dissolve Keywords End/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


#define ADVANCED_DISSOLVE_UNIVERSAL_RENDER_PIPELINE
#include "../cginc/Defines.cginc"
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            CBUFFER_START(UnityPerMaterial)



//Cutout/////////////////////////////////////////////////////////////////////////////////////
#if !defined(_AD_CUTOUT_STANDARD_SOURCE_NONE)

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardClip)	

	#if defined(_AD_CUTOUT_STANDARD_SOURCE_CUSTOM_MAP) || defined(_AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS) || defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
		DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap1)		
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap1Invert)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Tiling)
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Offset)
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Scroll)										
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap1Intensity)										
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap1Channel)	


		#if defined(_AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_TRIPLANAR)
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMapsTriplanarMappingSpace)
		#elif defined(_AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_SCREEN_SPACE)
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMapsScreenSpaceUVScale)	
		#endif


		#if defined(_AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS) || defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap2)       
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap2Invert)
	
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Tiling)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Offset)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Scroll)							
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap2Intensity)										
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap2Channel)		
	

			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMapsBlendType)	
		#endif

		#if defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap3)   
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap3Invert)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Tiling)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Offset)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Scroll)								
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap3Intensity)										
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap3Channel)					                    
		#endif  

	#else
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardBaseInvert)		
	#endif

#endif


//Geometric/////////////////////////////////////////////////////////////////////////////////
#if defined(ADVANCED_DISSOLVE_CUTOUT_GEOMETRIC_ENABLED)

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricNoise)
	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricInvert)	
	

	#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_XYZ)
			
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZAxis)		
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutGeometricXYZStyle)		
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZSpace)					
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZRollout)		
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometricXYZPosition)					

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)		
		
	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)		

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Height)	

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Height)	

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Size)				
		DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric1MatrixTRS)					

	#endif



	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_TWO) || defined (_AD_CUTOUT_GEOMETRIC_COUNT_THREE) || defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)

		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE) 

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)		
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Height)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Height)	
		
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric2MatrixTRS)				

		#endif	
		
	#endif	//Two

	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_THREE) || defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)
	
		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)	
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Height)

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Height)

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric3MatrixTRS)				

		#endif

	#endif	//Three

	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)
	
		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)			
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Height)		

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Height)		

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric4MatrixTRS)				

		#endif

	#endif	//Four

#endif


//Edge///////////////////////////////////////////////////////////////////////////////////////
#if !defined(_AD_EDGE_BASE_SOURCE_NONE)

	#if defined(_AD_EDGE_BASE_SOURCE_CUTOUT_STANDARD) || defined(_AD_EDGE_BASE_SOURCE_ALL)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseWidthStandard)		
	#endif

	#if defined(_AD_EDGE_BASE_SOURCE_CUTOUT_GEOMETRIC) || defined(_AD_EDGE_BASE_SOURCE_ALL)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseWidthGeometric)		
	#endif

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseShape)	
	DISSOLVE_PROP_FLOAT4(_AdvancedDissolveEdgeBaseColor)					
	DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeBaseColorIntensity)
	DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseColorTransparency)


	//Additional Color///////////////////////////////////////////////////////////////////////////
	#if defined(_AD_EDGE_ADDITIONAL_COLOR_BASE_COLOR)

		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_CUSTOM_MAP)
	
		DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeAdditionalColorMap)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapTiling)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapOffset)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapScroll)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorMapMipmap)

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_GRADIENT_MAP)

		DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeAdditionalColorMap)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapTiling)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapOffset)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapScroll)

		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorMapReverse)		
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorClipInterpolation)	

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_GRADIENT_COLOR)

		DISSOLVE_PROP_FLOAT4(_AdvancedDissolveEdgeAdditionalColor)	
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorIntensity)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorTransparency)	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorPhaseOffset)	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorClipInterpolation)		

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_USER_DEFINED)
	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

	#endif

	//UV Distortion//////////////////////////////////////////////////////////////////////////////
	#if !defined(ADVANCED_DISSOLVE_SHADER_GRAPH)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeUVDistortionStrength)	

		#if defined(_AD_EDGE_UV_DISTORTION_SOURCE_CUSTOM_MAP)
			DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeUVDistortionMap)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapTiling)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapOffset)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapScroll)
		#endif
	#endif


	//GI/////////////////////////////////////////////////////////////////////////////////////////
	#if defined(ADVANCED_DISSOLVE_META_PASS)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeGIMetaPassMultiplier)				
	#endif

#endif


            float4 _BaseMap_ST;
            half4 _BaseColor;
            half4 _SpecColor;
            half4 _EmissionColor;
            half _Cutoff;
            half _Smoothness;
            half _Metallic;
            half _BumpScale;
            half _OcclusionStrength;
            CBUFFER_END


//Advanced Dissolve/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "../cginc/Core.cginc"


            #include "AdvancedDissolveLitInput.hlsl"
            #include "AdvancedDissolveDepthOnlyPass.hlsl"
            ENDHLSL
        }

        // This pass it not used during regular rendering, only for lightmap baking.
        Pass
        {
            Name "Meta"
            Tags{"LightMode" = "Meta"}

            Cull Off

            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #pragma vertex UniversalVertexMeta
            #pragma fragment UniversalFragmentMeta

            #pragma shader_feature _SPECULAR_SETUP
            #pragma shader_feature _EMISSION
            #pragma shader_feature _METALLICSPECGLOSSMAP
            #pragma shader_feature _ALPHATEST_ON
            #pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

            #pragma shader_feature _SPECGLOSSMAP
            
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"


//Advanced Dissolve Keywords Start///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define _ADVANCED_DISSOLVE_KEYWORDS_BAKED

#pragma shader_feature_local _AD_STATE_ENABLED
#define                      _AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS
#define                      _AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_DEFAULT
#define                      _AD_CUTOUT_GEOMETRIC_TYPE_NONE
#define                      _AD_CUTOUT_GEOMETRIC_COUNT_ONE
#define                      _AD_EDGE_BASE_SOURCE_CUTOUT_STANDARD
#define                      _AD_EDGE_ADDITIONAL_COLOR_GRADIENT_MAP
#define                      _AD_EDGE_UV_DISTORTION_SOURCE_DEFAULT
#define                      _AD_GLOBAL_CONTROL_ID_NONE
//Advanced Dissolve Keywords End/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


#define ADVANCED_DISSOLVE_META_PASS
#define ADVANCED_DISSOLVE_UNIVERSAL_RENDER_PIPELINE
#include "../cginc/Defines.cginc"
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            CBUFFER_START(UnityPerMaterial)



//Cutout/////////////////////////////////////////////////////////////////////////////////////
#if !defined(_AD_CUTOUT_STANDARD_SOURCE_NONE)

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardClip)	

	#if defined(_AD_CUTOUT_STANDARD_SOURCE_CUSTOM_MAP) || defined(_AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS) || defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
		DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap1)		
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap1Invert)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Tiling)
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Offset)
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap1Scroll)										
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap1Intensity)										
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap1Channel)	


		#if defined(_AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_TRIPLANAR)
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMapsTriplanarMappingSpace)
		#elif defined(_AD_CUTOUT_STANDARD_SOURCE_MAPS_MAPPING_TYPE_SCREEN_SPACE)
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMapsScreenSpaceUVScale)	
		#endif


		#if defined(_AD_CUTOUT_STANDARD_SOURCE_TWO_CUSTOM_MAPS) || defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap2)       
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap2Invert)
	
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Tiling)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Offset)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap2Scroll)							
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap2Intensity)										
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap2Channel)		
	

			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMapsBlendType)	
		#endif

		#if defined(_AD_CUTOUT_STANDARD_SOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_AdvancedDissolveCutoutStandardMap3)   
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap3Invert)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Tiling)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Offset)
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutStandardMap3Scroll)								
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutStandardMap3Intensity)										
			DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardMap3Channel)					                    
		#endif  

	#else
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutStandardBaseInvert)		
	#endif

#endif


//Geometric/////////////////////////////////////////////////////////////////////////////////
#if defined(ADVANCED_DISSOLVE_CUTOUT_GEOMETRIC_ENABLED)

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricNoise)
	DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricInvert)	
	

	#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_XYZ)
			
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZAxis)		
		DISSOLVE_PROP_INT(_AdvancedDissolveCutoutGeometricXYZStyle)		
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZSpace)					
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometricXYZRollout)		
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometricXYZPosition)					

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)		
		
	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)		

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Height)	

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Position)					
		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Normal)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Radius)						
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric1Height)	

	#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)

		DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric1Size)				
		DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric1MatrixTRS)					

	#endif



	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_TWO) || defined (_AD_CUTOUT_GEOMETRIC_COUNT_THREE) || defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)

		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE) 

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)		
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Height)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric2Height)	
		
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric2Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric2MatrixTRS)				

		#endif	
		
	#endif	//Two

	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_THREE) || defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)
	
		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)	
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Height)

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric3Height)

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric3Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric3MatrixTRS)				

		#endif

	#endif	//Three

	#if defined(_AD_CUTOUT_GEOMETRIC_COUNT_FOUR)
	
		#if defined(_AD_CUTOUT_GEOMETRIC_TYPE_PLANE)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)			
			
		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_SPHERE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)	

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CAPSULE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Height)		

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CONE_SMOOTH)				

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Position)				
			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Normal)				
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Radius)					
			DISSOLVE_PROP_FLOAT(_AdvancedDissolveCutoutGeometric4Height)		

		#elif defined(_AD_CUTOUT_GEOMETRIC_TYPE_CUBE)			

			DISSOLVE_PROP_FLOAT3(_AdvancedDissolveCutoutGeometric4Size)			
			DISSOLVE_PROP_FLOAT4X4(_AdvancedDissolveCutoutGeometric4MatrixTRS)				

		#endif

	#endif	//Four

#endif


//Edge///////////////////////////////////////////////////////////////////////////////////////
#if !defined(_AD_EDGE_BASE_SOURCE_NONE)

	#if defined(_AD_EDGE_BASE_SOURCE_CUTOUT_STANDARD) || defined(_AD_EDGE_BASE_SOURCE_ALL)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseWidthStandard)		
	#endif

	#if defined(_AD_EDGE_BASE_SOURCE_CUTOUT_GEOMETRIC) || defined(_AD_EDGE_BASE_SOURCE_ALL)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseWidthGeometric)		
	#endif

	DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseShape)	
	DISSOLVE_PROP_FLOAT4(_AdvancedDissolveEdgeBaseColor)					
	DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeBaseColorIntensity)
	DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeBaseColorTransparency)


	//Additional Color///////////////////////////////////////////////////////////////////////////
	#if defined(_AD_EDGE_ADDITIONAL_COLOR_BASE_COLOR)

		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_CUSTOM_MAP)
	
		DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeAdditionalColorMap)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapTiling)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapOffset)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapScroll)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorMapMipmap)

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_GRADIENT_MAP)

		DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeAdditionalColorMap)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapTiling)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapOffset)
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorMapScroll)

		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorMapReverse)		
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorClipInterpolation)	

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_GRADIENT_COLOR)

		DISSOLVE_PROP_FLOAT4(_AdvancedDissolveEdgeAdditionalColor)	
		DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeAdditionalColorIntensity)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorTransparency)	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorPhaseOffset)	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorClipInterpolation)		

	#elif defined(_AD_EDGE_ADDITIONAL_COLOR_USER_DEFINED)
	
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeAdditionalColorAlphaOffset)

	#endif

	//UV Distortion//////////////////////////////////////////////////////////////////////////////
	#if !defined(ADVANCED_DISSOLVE_SHADER_GRAPH)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeUVDistortionStrength)	

		#if defined(_AD_EDGE_UV_DISTORTION_SOURCE_CUSTOM_MAP)
			DECLARE_TEXTURE_2D(_AdvancedDissolveEdgeUVDistortionMap)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapTiling)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapOffset)
			DISSOLVE_PROP_FLOAT2(_AdvancedDissolveEdgeUVDistortionMapScroll)
		#endif
	#endif


	//GI/////////////////////////////////////////////////////////////////////////////////////////
	#if defined(ADVANCED_DISSOLVE_META_PASS)
		DISSOLVE_PROP_FLOAT(_AdvancedDissolveEdgeGIMetaPassMultiplier)				
	#endif

#endif


            float4 _BaseMap_ST;
            half4 _BaseColor;
            half4 _SpecColor;
            half4 _EmissionColor;
            half _Cutoff;
            half _Smoothness;
            half _Metallic;
            half _BumpScale;
            half _OcclusionStrength;
            CBUFFER_END


//Advanced Dissolve/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "../cginc/Core.cginc"


            #include "AdvancedDissolveLitInput.hlsl"
            #include "AdvancedDissolveLitMetaPass.hlsl"

            ENDHLSL
        }
        Pass
        {
            Name "Universal2D"
            Tags{ "LightMode" = "Universal2D" }

            Blend[_SrcBlend][_DstBlend]
            ZWrite[_ZWrite]
            Cull[_Cull]

            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature _ALPHATEST_ON
            #pragma shader_feature _ALPHAPREMULTIPLY_ON

            #include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/Shaders/Utils/Universal2D.hlsl"
            ENDHLSL
        }


    }
    FallBack "Hidden/Universal Render Pipeline/FallbackError"
    CustomEditor "UnityEditor.Rendering.Universal.ShaderGUI.AdvancedDissolve_LitShader"
}
