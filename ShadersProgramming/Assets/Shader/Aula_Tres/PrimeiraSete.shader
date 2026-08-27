Shader "Custom/PrimeiraSete"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(-1, 1)) = 0
        _RY ("Alinhamento em Y", Range(-1, 1)) = 0
        _RB ("Alinhamento extra", Range(-10, 10)) = 0
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

            float j = ((uv.x * rx) + rb) - ((uv.y * ry) + rb);

            if(j >= 0.5)
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
