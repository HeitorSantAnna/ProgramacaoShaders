Shader "Custom/PrimeiraQuatro"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Linha em X", Range(-10, 10)) = 0
        _RY ("Linha em Y", Range(-10, 10)) = 0
        _RB ("Linha em B", Range(-10, 10)) = 0
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

        float _RX;

        float _RY;

        float _RB;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            
            float2 uv = IN.uv_MainTex;

            float rx = _RX;

            float ry = _RY;

            float rb = _RB;

            float t = ((uv.x * rx) + rb) + ((uv.y * ry) + rb);

            if(t - floor(t) >= 0.5)
            {
                o.Albedo = 1;
            }
            else
            {
                o.Albedo = 0;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
