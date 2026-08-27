Shader "Custom/PrimeiroDoze"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(-2, 2)) = 0
        _RY ("Alinhamento em Y", Range(-2, 2)) = 0
        _RB ("Alinhamento em B", Range(-10, 10)) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;

        fixed4 _SetColor;

        float _RX;
        float _RY;
        float _RB;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            float2 uv = IN.uv_MainTex;

            float j = 1 - length(float2(1, 1) - (uv / 0.5));

            o.Albedo = sin(j / _RX);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
