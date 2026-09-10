Shader "Custom/Bandeiras"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _ColorSec ("Segunda Cor", Color) = (1, 1, 1, 1)
        _ColorTer ("Terceira Cor", Color) = (1, 1, 1, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RColorS ("Slider de área direita", Range(0, 1)) = 0.5
        _LColorS ("Slider de área esquerda", Range(0, 1)) = 0.5
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
        fixed4 _ColorSec;
        fixed4 _ColorTer;
        float _RColorS, _LColorS;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            float2 uvs = IN.uv_MainTex;

            if(uvs.x <= _LColorS)
            {
                o.Emission = _Color;
            }
            else if(uvs.x > _LColorS && uvs.x <= _RColorS)
            {
                o.Emission = _ColorSec * c;
            }
            else
            {
                o.Emission = _ColorTer;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
