Shader "Custom/PrimriraDois"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 0)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RXO ("Range em X", Range(-5, 5)) = 0
        _RYO ("Range em Y", Range(-5, 5)) = 0
        _RBO ("Range de B", Range(-5, 5)) = 0

        _RXT ("Range em X", Range(-5, 5)) = 0
        _RYT ("Range em Y", Range(-5, 5)) = 0
        _RBT ("Range de B", Range(-5, 5)) = 0
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

        float _RXO;

        float _RYO;

        float _RBO;

        float _RXT;

        float _RYT;

        float _RBT;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;

            float2 uv = IN.uv_MainTex;

            float rxo = _RXO;

            float ryo = _RYO;

            float rbo = _RBO;

            float rxt = _RXT;

            float ryt = _RYT;

            float rbt = _RBT;

            float t = ((uv.x * rxo) + rbo) + ((uv.y * ryo) + rbo);

            float l = ((uv.x * rxt) + rbt) + ((uv.y * ryt) + rbt);

            o.Albedo = lerp(t, l, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
