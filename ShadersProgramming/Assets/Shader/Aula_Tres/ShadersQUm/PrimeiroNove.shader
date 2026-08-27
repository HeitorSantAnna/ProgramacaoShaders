Shader "Custom/PrimeiroNove"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(0.1, 0.5)) = 0.1
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

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            float2 uv = IN.uv_MainTex;

            float rx = _RX;

            float2 center = (0.5, 0.5);

            if(distance(uv.x, center) <= rx && distance(uv.y, center) <= rx)
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
