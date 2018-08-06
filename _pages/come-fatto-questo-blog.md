---
title: "Cosa c'è dietro questo blog?"
permalink: /blog-architettura-contenuti-piattaforma/
excerpt: "Architettura, piattaforma, contenuti.<br />Diario di sviluppo di un blog completamente _open_."
header:
  overlay_image: /assets/images/blog-foundations-overlay.jpg
  overlay_filter: 0.3
---

**Mi piace sperimentare con le tecnologie, lo ammetto. Dico sempre che non devo farmi trascinare, che poi perdo tempo prezioso che avrei potuto dedicare alla scrittura (o al sonno). Ma ci casco sempre e tutto sommato sono contento così, perché qualche volta ne viene fuori qualcosa che vale la pena condividere. In questo caso, una architettura per tenere online un blog tecnico-scientifico a un costo praticamente nullo.**

Sono da sempre stato alla ricerca di una piattaforma moderna ed economica per metter su un sito e, più in particolare, un blog.

In principio, lo ammetto, fu Wordpress.
Come molti della mia generazione, la prima che ha potuto comprarsi un nome a dominio senza pagarlo un occhio della testa, rimasi anche io fulminato sulla via di Automattic.

Mioddio, pagine _dinamiche!_ Che diavoleria è maoi questa!
E quanta potenza! Quante funzioni! Quanti plugin!

Ma si sa, con la maturità si insegue la semplicità. L'essenza. Non la sovrastruttura. L'orpello. Il superfluo.

Così, ci impiegai un po', ma anche io raggiunsi l'illuminazione. E abbandonai Wordpress, la sua collezione metastatica di plugin che oramai erano diventati senzienti, il suo database MySql che richiedeva più attenzioni di un bonsai e il server dedicato su cui girava. Molto, molto lentamente.

Cosa avrei offerto ai miei quattro, ignari, lettori?

### R: dove tutto ha inizio

Chi ha sbirciato sul mio profilo Linkedin avrà scoperto che sono quello che ora va di moda chiamare _data scientist_ e che mi piace lavorare su R.

Adoro questo linguaggio. Dopotutto ho iniziato la mia carriera su SAS e vengo ancora da una generazione in cui se volevi veramente cuccare dovevi conoscere il LISP[^1]. R è tutto questo più una serie praticamente illimitata di package tenuti insieme da un confusissimo e non standardizzato paradigma funzionale (nessuno è perfetto).

Lo uso per lavoro e lo uso per hobby e, soprattutto, lo uso per questo blog.

I post sono scritti direttamente in RMarkdown, un formato che consente di combinare testo scritto con sintassi markdown con codice R. Tutte le analisi e tutti i grafici sono, naturalmente, condotti con e da R e fanno uso di una intera costellazione di package a seconda dei bisogni specifici. Tidyverse, igraph e sna sono, però, praticamente sempre presenti.

Un package R chiamato knitr si occupa di eseguire il codice R contenuto in un file .Rmd e di renderizzare il risultato in un formato tra i tanti disponibili, come html, pdf (usando Latex), doc, ecc. Io ho impostato come formato di output markdown standard (tra poco sarà chiaro perché).

In questo modo, non ho bisogno di eseguire uno script separato, esportare i file grafici dei plot in immagini da collocare sulla directory apposita del sito, aggiornare i dati numerici, i risultati, le trasformazioni sui dati, ecc ecc.

Tutto è nello stesso posto, in un unico file.

Tutte le foto che utilizzo sono retina-ready,  ma sono solo la parte minoritaria del comparto grafico del sito. La quasi totalità di esso è, piuttosto, rappresentato da grafici e diagrammi prodotti dal codice R inserito nei file RMarkdown ed è tutto rigorosamente in formato SVG (quindi vettoriali).

Per ciò che concerne gli articoli, non dovrò preoccuparmi di device e risoluzioni. Posto che il front-end sia responsive, il comparto grafico del sito non mi creerà problemi per _decenni_.



[^1]: Ovviamente sto scherzando. Negli anni Novanta, lo ricorderete certamente, gli informatici non avevano bisogno del LISP per cuccare.



A proposito, sono anche un convinto sostenitore dell'open source. O si era già capito?


