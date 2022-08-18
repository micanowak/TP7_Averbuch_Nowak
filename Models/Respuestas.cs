using System;

namespace tp7_Averbuch_Nowak.Models
{
    public class Respuestas{
        private int _IdRespuesta;
        private int _Fk_IdPregunta;
        private char _OpcionRespuesta;
        private string _TextoRespuesta;
        private bool _EsCorrecta;

        public int IdRespuesta{ get {return _IdRespuesta;} set {_IdRespuesta = value;}}

        public int Fk_IdRespuesta{ get {return _Fk_IdPregunta;} set {_Fk_IdPregunta = value;}}

        public char OpcionRespuesta{ get {return _OpcionRespuesta;}set {_OpcionRespuesta = value;}}

        public string TextoRespuesta{ get {return _TextoRespuesta;}set {_TextoRespuesta = value;}}

        public bool EsCorrecta{ get {return _EsCorrecta;}set {_EsCorrecta = value;}}



        public Respuestas(int idResp, int fkIdPreg, char opcion, string texto, bool esCo)
        {
            _IdRespuesta=idResp;
            _Fk_IdPregunta=fkIdPreg;
            _OpcionRespuesta=opcion;
            _TextoRespuesta=texto;
            _EsCorrecta=esCo;
        }

        public Respuestas(){}
        
        
    }
}