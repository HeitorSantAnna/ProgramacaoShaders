Shader "Custom/Test"
{
    Properties
    {
        //_Variavel, padrão da linguagem C as variaveis terem anderline(_)
        //("Titulo no inspetor", TIPO) = Valor padrão

        _Color ("Cor Base", Color) = (1, 1, 1, 1)

        _R ("Red", Range(0, 1)) = 1

        _G ("Green", Range(0, 1)) = 1

        _B ("Blue", Range(0, 1)) = 1

        //Criando textura
        _Texture ("Textura", 2D) = "white"{}
    }

    SubShader
    {
        //Passagem de renderiazação de um objeto
        Pass
        {
            //Color[_Color]
            //Color([_R], [_G], [_B], 1)

            Cull Back

            Material
            {
                Diffuse ([_R], [_G], [_B], 0)
                Ambient (0.1, 0.1, 0.6, 0)
                Shininess 0.5
                Specular(1, 1, 1, 0)
                Emission (0, 0, 0)
            }
            Lighting On
            SeparateSpecular On
        }
        Pass
        {
            Cull Front
            SetTexture[_Texture]
            {
                combine texture * previous
            }
        }
    }
    FallBack "Diffuse"
}
