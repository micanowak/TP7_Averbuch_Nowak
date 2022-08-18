using System;

namespace tp7_Averbuch_Nowak.Models
{
    public class Preguntas{
        private int _IdPregunta;
        private string _TextoPregunta;
        private int _NivelDificultad;

        public int IdPregunta{ get {return _IdPregunta;} set {_IdPregunta = value;}}

        public string TextoPregunta{ get {return _TextoPregunta;}set {_TextoPregunta = value;}}

        public int NivelDificultad{ get {return _NivelDificultad;}set {_NivelDificultad = value;}}



        public Preguntas(int idPreg, string text, int niv)
        {
            _IdPregunta=idPreg;
            _TextoPregunta=text;
            _NivelDificultad=niv;
        }

        public Preguntas(){}
        
        
    }
}