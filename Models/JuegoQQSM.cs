using System;
using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

namespace tp7_Averbuch_Nowak.Models
{
    class JuegoQQSM
    {
        private static string _ConnectionString = @"Server=A-PHZ2-CIDI-022\SQLEXPRESS;DataBase=JuegoQQSM;Trusted_Connection=True;";

        private int _PreguntaActual;
        private char _RespuestaCorrectaActual;
        private int _PosicionPozo;
        private int _PozoAcumuladoSeguro;
        private int _PozoAcumulado;
        private bool _Comodin5050 = true;
        private bool _ComodinDobleChance = true;
        private bool _ComodinSaltearPregunta = true;
        private List<Pozo> _ListaPozo = new List<Pozo>();
        private Jugadores _Player;
    
        public static void IniciarJuego(string Nombre)
        {
            public int PreguntaActual{ get {return _PreguntaActual;} set {_PreguntaActual = value;}}
            public char RespuestaCorrectaActual{ get {return _RespuestaCorrectaActual;} set {_RespuestaCorrectaActual = value;}}
            public int PosicionPozo{ get {return _PosicionPozo;} set {_PosicionPozo = value;}}
            public int PozoAcumuladoSeguro{ get {return _PozoAcumuladoSeguro;} set {_PozoAcumuladoSeguro = value;}}
            public int PozoAcumulado{ get {return _PozoAcumulado;} set {_PozoAcumulado = value;}}
            public bool Comodin5050{ get {return _Comodin5050;} set {_Comodin5050 = value;}}
            public bool ComodinDobleChance{ get {return _ComodinDobleChance;} set {_ComodinDobleChance = value;}}
            public bool ComodinSaltearPregunta{ get {return _ComodinSaltearPregunta;} set {_ComodinSaltearPregunta = value;}}
            public List<Pozo> ListaPozo{ get {return _ListaPozo;} set {_ListaPozo = value;}}
            public Jugadores Player{ get {return _Player;} set {_Player = value;}}
        }
    }
}
