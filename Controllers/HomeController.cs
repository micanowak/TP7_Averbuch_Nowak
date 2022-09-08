﻿using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using tp7_Averbuch_Nowak.Models;

namespace tp7_Averbuch_Nowak.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult FinDelJuego()
    {
        ViewBag.InfoPlayer = JuegoQQSM.DevolverJugador();
        ViewBag.PozoGanado = ViewBag.InfoPlayer.PozoGanado;
        return View("PantallaFindelJuego");
    }

    public IActionResult Player()
    {
        return View();
    }

    public IActionResult Jugar(string Nombre)
    {
        JuegoQQSM.IniciarJuego(Nombre);
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.ListaPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("Pregunta");
    }

    public IActionResult Tutorial()
    {
        return View();
    }

    public IActionResult PreguntaRespondida(char Opcion1, char Opcion2)
    {
        bool Acerto = JuegoQQSM.RespuestaUsuario(Opcion1,Opcion2);
        if(Acerto){
        return View("RespuestaPreguntaOk");
        } else{
        return View("PantallaFindelJuego");
        }
            
    }
    public IActionResult Pregunta()
    {
        return View();
    }

    
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
