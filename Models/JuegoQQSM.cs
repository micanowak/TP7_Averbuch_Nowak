using System;
using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

namespace tp7_Averbuch_Nowak.Models
{
    class JuegoQQSM{
        private static string _ConnectionString = @"Server=A-PHZ2-CIDI-023\SQLEXPRESS;DataBase=JuegoQQSM;Trusted_Connection=True;";

        private int _PreguntaActual;
        private char _RespuestaCorrectaActual;
        private int _PosicionPozo;
        private int _PozoAcumuladoSeguro;
        private int _PozoAcumulado;
        private bool _Comodin5050 = true;
        private bool _ComodinDobleChance = true;
        private bool _ComodinSaltearPregunta = true;
        private List<Pozo> ListaPozo = new List<Pozo>();
        private Jugadores Player;
    
    }
}