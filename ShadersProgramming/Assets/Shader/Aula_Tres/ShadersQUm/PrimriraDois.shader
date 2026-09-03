Shader "Custom/PrimriraDois"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 0)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(-10, 10)) = 0
        _RY ("ALinhamento em Y", Range(-10, 10)) = 0
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

        fixed4 _SecColor;

        float _RX;
        float _RY;
        float _RB;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            float2 uv = IN.uv_MainTex;

            float j = (1 - (((uv.x * _RX) - (uv.y * _RY)) + _RB));

            float i = (((uv.x * _RX) - (uv.y * _RY)) + _RB);

            //x = 3, y = 5, b = 6.6
            float tes = sin(j);

            //o.Albedo = tes;

            float res = saturate(tes);

            fixed4 finalcolor = lerp(_Color, _SecColor, res);

            o.Albedo = finalcolor;
            //o.Smoothness = 0.1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
