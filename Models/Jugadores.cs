using System;

namespace tp7_Averbuch_Nowak.Models
{
    public class Jugadores{
        
        private int _IdJugador;
        private string _Nombre;
        private DateTime _FechaHora;
        private int _PozoGanado;
        private bool _ComodinDobleChance;
        private bool _ComodinSaltear;
        private bool _Comodin50;

        public int IdJugador{ get {return _IdJugador;} set {_IdJugador = value;}}

        public string Nombre{ get {return _Nombre;} set {_Nombre = value;}}

        public DateTime FechaHora{ get {return _FechaHora;}set {_FechaHora = value;}}

        public int PozoGanado{ get {return _PozoGanado;}set {_PozoGanado = value;}}

        public bool ComodinDobleChance{ get {return _ComodinDobleChance;}set {_ComodinDobleChance = value;}}

        public bool ComodinSaltear{ get {return _ComodinSaltear;}set {_ComodinSaltear = value;}}

        public bool Comodin50{ get {return _Comodin50;}set {_Comodin50 = value;}}


        public Jugadores(int idJug, string nom, DateTime fecha, int pozo, bool comDob, bool comSal, bool com50)
        {
            _IdJugador=idJug;
            _Nombre=nom;
            _FechaHora=fecha;
            _PozoGanado=pozo;
            _ComodinDobleChance=comDob;
            _ComodinSaltear=comSal;
            _Comodin50=com50;
        }

        public Jugadores(){}
        
        
    }
}