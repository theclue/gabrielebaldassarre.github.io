---
title: "Introduzione agli autovettori e agli autovalori"
excerpt: "In questo articolo introdurremo l'argomento degli autovalori e autovettori, uno dei concetti base della geometria e dell'algebra lineare che trova applicazioni pratiche in moltissimi campi compresa, naturalmente, la Social Network Analysis."
header:
  overlay_image: /assets/images/eigenvectors-overlay.jpg
  overlay_filter: 0.5
---

Lo studio degli autovettori, e dei corrispondenti autovalori, è un qualcosa in cui ci siamo cimentati probabilmente tutti almeno una volta nella vita. In pochi, tuttavia, sanno che questo strumento è di importanza vitale anche per la Social Network Analysis per tutto ciò che concerne la [centralità]({% post_url 2018-07-02-importanza-individui-rete-centralita %}) e ancora meno sospettano che gli autovettori sono alla base di nientemeno che l'algoritmo di ricerca di Google.

Senza la pretesa di fornire una trattazione rigorosa sull'argomento come se dovessimo preparare un esame di algebra lineare, qui ci concentreremo sull'intuizione dei concetti fondamentali così da avere tutti le conoscenze necessarie per utilizzarli in ambito di analisi delle reti sociali.

## Autovettori e autovalori: una definizione informale

Supponiamo di avere una matrice di trasformazione quadrata \\( A \\). Essa può essere vista come un _operatore_ perché può essere applicata (mediante prodotto scalare) ad un vettore \\( \vec{x} \\) al fine di ottenere un vettore \\( \vec{y} \\), ovvero:

$$ A\vec{x} = \vec{y} $$

Per chi non ha paura di una indigestione di algebra lineare possiamo aggiungere che la matrice \\( A \\) è un [endomorfismo](https://it.wikipedia.org/wiki/Endomorfismo).

Ebbene, __gli autovettori sono quei vettori che giacciono su delle direzioni caratteristiche della trasformazione \\( A \\) tali per cui quando sono moltiplicati per \\(A \\) danno come risultato altrettanti vettori non nulli che si differenziano dai vettori di partenza al più per il modulo e per il verso, mentre le loro direzioni restano invariate.__

In altri termini, supponendo che \\( A \\) sia una matrice \\( 2 \times 2 \\) di righe linearmente indipendenti, ovvero un endomorfismo in \\( \mathbb{R}^2 \\), allora esiste qualche coppia \\( (x, y) \ne (0, 0) \\) che, trasformata mediante \\( A \\), dia come risultato ancora la coppia \\( (x, y) \\) moltiplicata per \\( \lambda \\), che ne modifica il modulo e, eventualmente, il verso ovvero:

$$ A(x, y) = \lambda(x, y) $$

I rispettivi coefficienti \\( \lambda \\) degli autovettori prendono il nome di __autovalori__. In caso di \\( \lambda \\) positivo, il rispettivo vettore trasformato non subisce un cambiamento di verso; quando negativo, il verso ne risulterà opposto. Ma, sia come sia, la direzione individuata dagli autovettori non cambia.

{% include figure image_path="/assets/images/eigenvectors-extended.gif" alt="Esempio di trasformazione e autovettori" caption="Esempio di trasformazione. La matrice \\( A = \begin{bmatrix} 2 & 1 \\\\ 1 & 2 \end{bmatrix} \\) produce gli autovettori \\( v_1= \begin{pmatrix} 1 & 1 \end{pmatrix}^T \\) e \\( v_2= \begin{pmatrix} 1 & -1 \end{pmatrix}^T \\) nelle direzioni rappresentate rispettivamente dalla retta blu e violetto. Tutti i vettori blu, paralleli alla direzione individuata da \\( v_1 \\) sono autovettori perché, quando trasformati attraverso \\( A \\), individuano un vettore con la stessa direzione, ma con un modulo moltiplicato per l'autovalore \\( \lambda_1=3 \\). Allo stesso modo, i vettori viola sono autovettori con autovalore \\( \lambda_2 = 1 \\). I vettori rossi, invece, quando trasformati da \\( A \\), variano in direzione: essi non sono autovettori (fonte: [Wikipedia](https://en.wikipedia.org/wiki/File:Eigenvectors-extended.gif))." %}

## Come calcolare gli autovettori e gli autovalori

Per il calcolo degli autovalori, e quindi degli autovettori, procediamo algebricamente a partire da:

$$ A\vec{v} = \lambda\vec{v} \tag{1} $$

che equivale a scrivere

$$ \vec{v}(A - \lambda I) = 0 \tag{2} $$

La relazione (2) produce un sistema di equazioni lineari _omogeneo_ ovvero privo del termine noto. Il che significa che è possibile trovare soluzioni non nulle del vettore \\( \vec{v} \\) solo se il determinante della matrice che moltiplica \\( \vec{v} \\) è zero. In simboli:

$$ \bbox[5px,border:1px solid red]{ det(A - \lambda I) = 0 } $$

che, una volta risolto, ci consente di individuare gli autovalori \\( \lambda_{1 \cdots N} \\) e i corrispettivi autovettori.

## Diagonalizzazione e cambio di sistema di riferimento

Come dicevamo, gli autovettori ricoprono un ruolo essenziale in tanti campi del sapere, dalle scienze delle costruzioni alla meccanica quantistica, dall'elettromagnetismo alla teoria dell'informazione, fino allo studio delle reti.

Alla base di tanta importanza è soprattutto la proprietà degli autovettori di poter trasformare una matrice  \\( A \\) nella sua corrispettiva __diagonalizzata__, a seguito di un cambio di sistema di riferimento a favore di uno i cui assi siano gli autovettori della matrice stessa. Per un dato sistema, quindi, e posto che gli autovettori esistano e siano reali e non nulli, tale proprietà consente di semplificare enormemente i calcoli, poiché le operazioni, eventuali, da condurre sul sistema trasformato da \\( A_{diag} \\) saranno tutte algebriche, relativamente rapide da computare. Vediamolo in pratica.

## La compressione dell'informazione

Ma non è la diagonalizzazione la caratteristica degli autovettori e degli autovalori più interessante, per il nostro campo di interesse. O almeno, non direttamente.

La __matrice degli autovettori__, formata - come intuibile da tutti gli autovettori di \\( A \\) esprime anche la __varianza__ di \\(A \\), ovvero _le informazioni che contiene_. Questa si rispecchia negli autovalori: ognuno di essi, infatti, esprimerà una certa percentuale di varianza della matrice \\( A \\):
