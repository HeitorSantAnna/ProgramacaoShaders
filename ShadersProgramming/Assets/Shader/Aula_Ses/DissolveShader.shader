Shader "Custom/DissolveShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SecTex ("Segunda Textura", 2D) = "white" {}
        _AlphaValue ("Dissolve", Range(0, 1)) = 0

        [HDR] _EmissionColor ("Cor de Emissão", Color) = (1, 1, 1, 1)
        _Noise ("Noise", 2D) = "white" {}
        _Thickness ("Thickness", Range(0, 0.1)) = 0
        _Dissolve ("Dissolve", Range(0, 1)) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:blend

        #include "Noise.txt"

        sampler2D _MainTex, _SecTex, _Noise;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color, _EmissionColor;
        half _AlphaValue;
        float _Dissolve, _Thickness;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
