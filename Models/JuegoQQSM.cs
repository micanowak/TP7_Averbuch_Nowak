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
        private bool _Comodin5050;
        private bool _ComodinDobleChance;
        private bool _ComodinSaltearPregunta;
        private List<Pozo> _ListaPozo = new List<Pozo>();
        private Jugadores _Player;

        
        public void IniciarJuego(string Nombre)
        {
            string SQL = "INSERT INTO Jugadores(Nombre, FechaHora, PozoGanado, ComodinDobleChance, ComodinSaltear, Comodin50) VALUES (@pNombre, @pFechaHora, @pPozoGanado, @pComodinDobleChance, @pComodinSaltear, @pComodin50";
            using(SqlConnection db = new SqlConnection(_ConnectionString)){
                db.Execute(SQL, new{pNombre = Nombre, pFechaHora = 1, pPozoGanado = 0, pComodinDobleChance = true, pComodinSaltear = true, pComodin50 = true});
            }
            SQL = "SELECT TOP 1 * FROM Jugadores ORDER BY IdJugador DESC";
            using(SqlConnection db = new SqlConnection(_ConnectionString)){
                _Player = db.QueryFirstOrDefault(SQL);
            }
            _PreguntaActual = 1;
            _PosicionPozo = 1;
            _PozoAcumuladoSeguro = 0;
            _PozoAcumulado = 0;
        }

        public Preguntas ObtenerProximaPregunta(){
            Preguntas pregCompleta = new Preguntas();
            string SQL = "SELECT * FROM Preguntas WHERE IdPregunta = @pPreguntaActual";
            using(SqlConnection db = new SqlConnection(_ConnectionString)){
                pregCompleta = db.QueryFirstOrDefault(SQL, new{pPreguntaActual = _PreguntaActual});
            }
            return pregCompleta;
        }

        public List<Respuestas> ObtenerRespuestas(){
            List<Respuestas> respPregActual = new List<Respuestas>();
            string SQL = "SELECT OpcionRespuesta FROM Respuestas WHERE fkIdPregunta = @pPreguntaActual AND Correcta = true";
            using(SqlConnection db = new SqlConnection(_ConnectionString)){
                _RespuestaCorrectaActual = db.QueryFirstOrDefault(SQL, new{pPreguntaActual = _PreguntaActual});
            }
            SQL = "SELECT * FROM Respuestas WHERE fkIdPregunta = @pPreguntaActual";
            using(SqlConnection db = new SqlConnection(_ConnectionString)){
                respPregActual = db.QueryFirstOrDefault(SQL, new{pPreguntaActual = _PreguntaActual});
            }
            return respPregActual;
        }

        public bool RespuestaUsuario(char Opción, char OpcionComodin){
            
            
            return;
        }
    }
}
