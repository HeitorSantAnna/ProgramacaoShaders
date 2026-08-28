Shader "Custom/PrimeiraTres"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 1)
        _Blue ("Azul", Color) = (0, 0, 1, 1)
        _Red ("Vermelho", Color) = (0, 0, 0, 1)
        _Green ("Verde", Color) = (0, 0, 0, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(-20, 20)) = 0
        _RY ("Alinhamento em Y", Range(-20, 20)) = 0
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

            //Usar sin e cos para variar entre zero e um
            //O sin em x é 1.5

            //limit red x = 2, y = -2, b = -2
            float limitred = ((uv.x * 2)) - ((uv.y * -2)) - 2;

            float limitgreen = ((uv.x * 1)) - ((uv.y * 1)) + 0;

            fixed4 tes = fixed4(limitred, limitgreen, 1, 1);

            o.Albedo = tes;
            o.Emission = tes * 1.5;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
