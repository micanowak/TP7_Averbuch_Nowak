using System;

namespace tp7_Averbuch_Nowak.Models
{
    public class Pozo{
        private int _Importe;
        private bool _ValorSeguro;

        public int Importe{ get {return _Importe;} set {_Importe = value;}}
        public bool ValorSeguro{ get {return _ValorSeguro;}set {_ValorSeguro = value;}}


        public Pozo(int imp, bool valSeg)
        {
            _Importe=imp;
            _ValorSeguro=valSeg;
        }
        
        
    }
}