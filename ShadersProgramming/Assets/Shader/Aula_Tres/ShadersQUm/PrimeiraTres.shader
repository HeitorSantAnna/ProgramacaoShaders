Shader "Custom/PrimeiraTres"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 1)
        _Blue ("Azul", Color) = (0, 0, 1, 1)
        _Red ("Vermelho", Color) = (1, 0, 0, 1)
        _Green ("Verde", Color) = (0, 1, 0, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(-10, 10)) = 0
        _RY ("Alinhamento em Y", Range(-10, 10)) = 0
        _RB ("Alinhamento em B", Range(-20, 20)) = 0
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

        fixed4 _Blue, _Red, _Green, _SecColor;

        float _RX, _RY, _RB;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            float2 uv = IN.uv_MainTex;

            float limitv = ((uv.x * _RX) + _RB) + ((uv.y * _RY) + _RB);

            fixed4 res = _Red + _Green;
          
            if(uv.y >= 0.5 && limitv < 0.5)
            {
                res = _Green = (0, 0, 0, 0);
            }
            else 
            {
                res = _Green = (0, 1, 0, 1);
            }

            if(uv.y <= 0.5 && limitv < 0.5)
            {
                res = _Red = (0, 0, 0, 0);
            }
            else
            {
                res = _Red = (1, 1, 1, 1);
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
