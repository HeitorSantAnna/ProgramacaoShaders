Shader "Custom/Q_Quatro"
{
    Properties
    {
        _PrinColor ("Primeira Cor", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SecColor ("Segunda Cor", Color) = (1, 1, 1, 1)
        _AA ("Alinhamento em A", Range(-5, 5)) = 0
        _AB ("Alinhamento em B", Range(-5, 5)) = 0
        _AC ("Alinhamento em C", Range(-5, 5)) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:blend

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _PrinColor, _SecColor;
        float _AA, _AB, _AC;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            float2 uv = IN.uv_MainTex;
            float t = step(sin(((uv.x * _AA) + (uv.y * _AB)) + _AC), 0.5);
            if(t >= 0.5)
            {
                o.Albedo = _PrinColor;
            } 
            else
            {
                o.Albedo = _SecColor;
            }

            o.Alpha = 0.5;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
