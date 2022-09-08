using System.Diagnostics;
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

    public IActionResult Player()
    {
        return View();
    }

    public IActionResult Pregunta()
    {
        return View();
    }

    public IActionResult Descartar50()
    {
        ViewBag.Descartar =  JuegoQQSM.Descartar50();
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        List<Respuestas> RespuestasNoDescartadas= new List<Respuestas>();
        
        foreach(Respuestas item in ViewBag.ListaRespuestas)
        {
            if(item.OpcionRespuesta!=ViewBag.Descartar[0] && item.OpcionRespuesta!=ViewBag.Descartar[1])
            {
                RespuestasNoDescartadas.Add(item);
            }
        }
        ViewBag.ListaRespuestas = RespuestasNoDescartadas;
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.ListaPozo = JuegoQQSM.ListaPozo();

        return View("Pregunta");
    }

    public IActionResult FinDelJuego()
    {
        ViewBag.InfoPlayer = JuegoQQSM.DevolverJugador();
        ViewBag.PozoGanado = ViewBag.InfoPlayer.PozoGanado;
        return View("PantallaFindelJuego");
    }


    public IActionResult Jugar(string Nombre)
    {
        JuegoQQSM.IniciarJuego(Nombre);
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.ListaPozo = JuegoQQSM.ListaPozo();
        return View("Pregunta");
    }

    public IActionResult Tutorial()
    {
        return View();
    }

    public IActionResult PreguntaRespondida(char Opcion1, char Opcion2)
    {
        bool Acerto = JuegoQQSM.RespuestaUsuario(Opcion1,Opcion2);
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        if(Acerto){
        return View("RespuestaPreguntaOk");
        } else{
        return View("PantallaFindelJuego");
        }
            
    }

    
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
