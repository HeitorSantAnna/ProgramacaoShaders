Shader "Custom/AT_Nove"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SecColor ("Segunda Cor", Color) = (1, 1, 1, 1)
        _Dist ("Distancia da Borda", Range(0, 1)) = 0
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

        fixed4 _Color, _SecColor;

        float _Dist;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            float2 uv = IN.uv_MainTex;

            float2 center = 0.5;

            if(distance(center, _Dist) < 0.2)
            {
                o.Albedo = _Color;
            }
            else
            {
                o.Albedo = _SecColor;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
