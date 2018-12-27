# arduino_load_cell
Firmware and GUI for reading data from load cell on Arduino 

## Componenti

All'interno del repo i file sorgente sono contenuti nella cartella load_cell.
Inizialmente si trova il firmware .ino da caricare all'interno di arduino dopo aver scaricato e installaot la libreria specificata all'interno del codice sorgente.

Il programma appena eseguto dal microcontrollore effettuerà una taratura iniziale, aggiustabile poi inviando '+' o '-' da monitor seriale presente sulla piattaforma.

Una volta eseguita la taratura il microcontrollore inizierà a inviare messaggi seriali a 112500 baud.

## GUI

Aprire dunque, una volta caricato il tutto il file .pde all'interno della cartella iot_complete.
Si tratta di un'interfaccia grafica scitta in Processing, è dunque necessario aver installato il suo compiler e IDE recuperabile al seguente indirizo

https://processing.org/download/

Nel src code vi è un parametro max_kg settato a 20, cambiare a seconda del peso massimo misurabile.
Una volta settato tutto fate partire il programma e vi verrà mostrato in grafico il report dei vari valori ricevuti, per salvare il tutto premere il pulsante UP e il programma si arresteà slavando nella cartella /data un file csv contenente x(secondi) e kg(dati rilevati).

# In caso di emergenza

In caso di emergenza è possibile utilizzare il plotter seriale presente tra gli strumenti di arduino che mostrerà come per la GUI in processing i valori mantati in seriale in tempo reale

@Author Riccardo Bussola
