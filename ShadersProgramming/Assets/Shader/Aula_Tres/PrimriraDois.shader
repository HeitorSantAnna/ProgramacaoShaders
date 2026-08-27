Shader "Custom/PrimriraDois"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 0)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Range em X", Range(0, 20)) = 0
        _RY ("Range em Y", Range(0, 1)) = 0
        _RB ("Range de B", Range(0, 90)) = 0
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

            float rx = _RX;

            float ry = _RY;

            float rb = _RB;

            o.Albedo = sin((uv.x * rx) + rb);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
