/*primer seccion: codigo de usuario*/
package com.mycompany.jflex;

%%

/*segunda seccion: configuracion*/
%class LexicoFlex
%unicode
%line
%column
%int
%public

ESPACIOS=[\n|\r|\n\r] | [\t\f]
VOCALES=[A|E|I|O|U]|[a|e|i|o|u]
LETRA = [b-dB-D]|[f-hF-H]|[j-nJ-N]|[p-tP-T]|[v-zV-Z]
%{
   private int vocal1=0;
   private int vocal2=0;
   private int vocal3=0;
   private int vocal4=0;
   private int vocal5=0;

    private void incrementar(int op){
       switch (op) {
            case 1:
                vocal1++;
                break;
            case 2:
                vocal2++;
                break;
            case 3:
                vocal3++;
                break;
            case 4:
                vocal4++;
                break;
            case 5:
                vocal5++;
                break;    
            default:
                throw new AssertionError();
        }
    }
    
    public int getVocal1() {
        return vocal1;
    }
    public int getVocal2() {
        return vocal2;
    }
    public int getVocal3() {
        return vocal3;
    }
    public int getVocal4() {
        return vocal4;
    }
    public int getVocal5() {
        return vocal5;
    }
    
%}


%eof{
    System.out.println("Letras con una Vocal: "+getVocal1());
    System.out.println("Letras con dos Vocal: "+getVocal2());
    System.out.println("Letras con tres Vocal: "+getVocal3());
    System.out.println("Letras con cuatro Vocal: "+getVocal4());
    System.out.println("Letras con cinco Vocal: "+getVocal5());
    
%eof}

%%


/*tercer seccion: reglase lexicas*/

({ESPACIOS})	{}
({LETRA})* ({VOCALES}) ({LETRA})* {incrementar(1);}
({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* {incrementar(2);}
({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})*  {incrementar(3);}
({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})*  {incrementar(4);}
({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})*  {incrementar(5);}
[^] {}