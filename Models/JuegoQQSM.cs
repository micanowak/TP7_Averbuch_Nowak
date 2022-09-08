using System;
using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

namespace tp7_Averbuch_Nowak.Models
{
    class JuegoQQSM
    {
        private static string _ConnectionString = @"Server=A-PHZ2-CIDI-022\SQLEXPRESS;DataBase=JuegoQQSM;Trusted_Connection=True;";

        private static int _PreguntaActual;
        private static char _RespuestaCorrectaActual;
        private static int _PosicionPozo;
        private static int _PozoAcumuladoSeguro;
        private static int _PozoAcumulado;
        private static bool _Comodin5050;
        private static bool _ComodinDobleChance;
        private static bool _ComodinSaltearPregunta;
        private static List<Pozo> _ListaPozo = new List<Pozo>();
        private static Jugadores _Player;

        
        public static void IniciarJuego(string Nombre)
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
            _PosicionPozo = 0;
            _PozoAcumuladoSeguro = 0;
            _PozoAcumulado = 0;
        }

        public static List<Pozo> ListaPozo(){
            Pozo p1 = new Pozo(1000, false);
            Pozo p2 = new Pozo(2000, false);
            Pozo p3 = new Pozo(5000, true);
            Pozo p4 = new Pozo(7000, false);
            Pozo p5 = new Pozo(10000, false);
            Pozo p6 = new Pozo(12000, true);
            Pozo p7 = new Pozo(15000, false);
            Pozo p8 = new Pozo(18000, false);
            Pozo p9 = new Pozo(20000, true);
            Pozo p10 = new Pozo(22000, true);
            _ListaPozo.Add(p1);
            _ListaPozo.Add(p2);
            _ListaPozo.Add(p3);
            _ListaPozo.Add(p4);
            _ListaPozo.Add(p5);
            _ListaPozo.Add(p6);
            _ListaPozo.Add(p7);
            _ListaPozo.Add(p8);
            _ListaPozo.Add(p9);
            _ListaPozo.Add(p10);
            return _ListaPozo;
        }

        public static Preguntas ObtenerProximaPregunta(){
            Preguntas pregCompleta = new Preguntas();
            string SQL = "SELECT * FROM Preguntas WHERE IdPregunta = @pPreguntaActual";
            using(SqlConnection db = new SqlConnection(_ConnectionString)){
                pregCompleta = db.QueryFirstOrDefault(SQL, new{pPreguntaActual = _PreguntaActual});
            }
            return pregCompleta;
        }

        public static List<Respuestas> ObtenerRespuestas(){
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

        public static bool RespuestaUsuario(char Opcion, char OpcionComodin){
            
            if(OpcionComodin=='A' || OpcionComodin=='B' || OpcionComodin=='C' || OpcionComodin=='D'){
                _ComodinDobleChance = false;
                string SQL = "UPDATE Jugadores SET ComodinDobleChance = 0 WHERE IdJugador = @pIdJugador";
                using(SqlConnection db = new SqlConnection(_ConnectionString)){
                db.Execute(SQL, new{pIdJugador = _Player.IdJugador});
                }
            }

            if(Opcion==_RespuestaCorrectaActual || OpcionComodin == _RespuestaCorrectaActual){
                if(_ListaPozo[_PosicionPozo].ValorSeguro){
                    int importeSumado;
                    string SQL = "SELECT PozoGanado FROM Jugadores WHERE IdPregunta = @pIdJug";
                    using(SqlConnection db = new SqlConnection(_ConnectionString)){
                    importeSumado = db.QueryFirstOrDefault(SQL, new{pIdJug = _Player.IdJugador});
                    }
                    importeSumado +=_ListaPozo[_PosicionPozo].Importe;
                    SQL = "UPDATE Jugadores SET PozoGanado = @pImporteSumado WHERE IdJugador = @pIdJugador";
                    using(SqlConnection db = new SqlConnection(_ConnectionString)){
                    db.Execute(SQL, new{pImporteSumado = importeSumado, pIdJugador = _Player.IdJugador});
                    }
                }
                _PosicionPozo++;
                
            }
            
            return true;
        }

        public static void SaltearPregunta(){
            if(_ComodinSaltearPregunta){
                _ComodinSaltearPregunta = false;
                string SQL = "UPDATE Jugadores SET ComodinSaltear = 0 WHERE IdJugador = @pIdJugador";
                using(SqlConnection db = new SqlConnection(_ConnectionString)){
                db.Execute(SQL, new{pIdJugador = _Player.IdJugador});
                }
                _PreguntaActual++;
                ObtenerProximaPregunta();
            }
        }

        public static int DevolverPosicionPozo(){
            return _PosicionPozo;
        }

        public static char[] Descartar50(){
            char[] dev;
            if(_Comodin5050){
                _Comodin5050 = false;
                string SQL = "UPDATE Jugadores SET Comodin50 = 0 WHERE IdJugador = @pIdJugador";
                using(SqlConnection db = new SqlConnection(_ConnectionString)){
                db.Execute(SQL, new{pIdJugador = _Player.IdJugador});
                }
                SQL = "SELECT TOP 2 IdRespuesta FROM Respuestas WHERE fkIdPregunta = @pPreguntaActual and Correcta = 0";
                using(SqlConnection db = new SqlConnection(_ConnectionString)){
                dev = db.QueryFirstOrDefault(SQL, new{pPreguntaActual = _PreguntaActual});
                }
            } else{
                dev= null;
            }

            return dev;
        }

        public static Jugadores DevolverJugador(){
            return _Player;
        }
    }
}
