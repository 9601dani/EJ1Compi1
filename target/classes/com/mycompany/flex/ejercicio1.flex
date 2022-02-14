/*primer seccion: codigo de usuario*/
package com.mycompany.jflex;

import java.util.List;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import com.mycompany.ejerciciocompi1.controller.Numero;
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
NUMERO=[0-9]
%{
private ArrayList<Numero> numberList= new ArrayList<>();
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
    public void addNumber(){
        numberList.add(new Numero(yyline+1, yycolumn+1));
    }   
    public List<Numero> getNumberList(){
        return numberList;
    }
    
%}


%eof{
    String result="";
     result+="Palabras con una vocales: "+getVocal1()+"\n";
    result+="Palabras con dos vocales: "+getVocal2()+"\n";
    result+="Palabras con tres vocales: "+getVocal3()+"\n";
    result+="Palabras con cuatro vocales: "+getVocal4()+"\n";
    result+="Palabras con cinco vocales: "+getVocal5()+"\n";
        JOptionPane.showMessageDialog(null, result);
    
%eof}

%%


/*tercer seccion: reglase lexicas*/

({ESPACIOS})	{}
({LETRA})* ({VOCALES}) ({LETRA})* {incrementar(1);}
({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* {incrementar(2);}
({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})*  {incrementar(3);}
({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})*  {incrementar(4);}
({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})* ({VOCALES}) ({LETRA})*  {incrementar(5);}
({NUMERO})+ {addNumber();}
[^] {}