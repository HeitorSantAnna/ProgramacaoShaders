Shader "Custom/PrimeiraOito"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(-1, 1)) = 0
        _RY ("Alinhamento em Y", Range(-1, 1)) = 0
        _RB ("Alinhamento em B", Range(-10, 10)) = 0
        _RC ("Alinhamento em C", Range(-10, 10)) = 0
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
        float _RC;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            float2 uv = IN.uv_MainTex;

            float rx = _RX;
            float ry = _RY;
            float rb = _RB;
            float rc = _RC;

            float j = ((uv.x * rx) + rb);

            float i = ((uv.y * ry) + rb);

            /*float result = j - i;

            float g = floor(sin((uv.y * rx) + ry) * rb + rc);

            if(g >= 0.5)
            {
                o.Albedo = _SecColor;
            }
            else
            {
                o.Albedo = _Color;
            }*/

            if(uv.x >= 0.5 && uv.y < 0.5 || uv.x < 0.5 && uv.y >= 0.5)
            {
                o.Albedo = _SecColor;
            }
            else
            {
                o.Albedo = _Color;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
