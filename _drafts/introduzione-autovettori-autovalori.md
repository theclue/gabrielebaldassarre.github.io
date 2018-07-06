---
title: "Introduzione agli autovettori e agli autovalori"
excerpt: "In questo articolo introdurremo l'argomento degli autovalori e autovettori, uno dei concetti base della geometria e dell'algebra lineare che trova applicazioni pratiche in moltissimi campi compresa, naturalmente, la Social Network Analysis."
header:
  overlay_image: /assets/images/eigenvectors-overlay.png
  overlay_filter: 0.5
---

Lo studio degli autovettori, e dei corrispondenti autovalori, è un qualcosa in cui ci siamo cimentati tutti, soprattutto chi ha ricevuto una formazione tecnico-scientifica. In pochi, tuttavia, sanno che questo strumento è di importanza vitale anche per la Social Network Analysis per tutto ciò che concerne la [centralità]({% post_url 2018-07-02-importanza-individui-rete-centralita %}) e ancora meno sospettano che gli autovettori sono alla base di nientemeno che l'algoritmo di ricerca di Google.

Senza la pretesa di fornire una trattazione rigorosa sull'argomento come se dovessimo preparare un esame di algebra lineare, qui ci concentreremo sull'intuizione dei concetti fondamentali così da avere tutti le conoscenze necessarie per utilizzarli in ambito di analisi delle reti sociali.

## Autovettori e autovalori: una definizione informale

Supponiamo di avere una matrice di trasformazione quadrata \\( A \\). Essa può essere vista come un _operatore_ perché può essere applicata (mediante prodotto scalare) ad un vettore \\( \vec{x} \\) al fine di ottenere un vettore \\( \vec{y} \\), ovvero:

$$ A\vec{x} = \vec{y} $$

Per chi non ha paura di una indigestione di algebra lineare possiamo aggiungere che la matrice \\( A \\) è un [endomorfismo](https://it.wikipedia.org/wiki/Endomorfismo).

Ebbene, __gli autovettori sono quei vettori che giacciono su delle direzioni caratteristiche della trasformazione \\( A \\) tali per cui quando sono moltiplicati per \\(A \\) danno come risultato altrettanti vettori non nulli che si differenziano dai vettori di partenza al più per degli scalari \\( \lambda_n \\) e, eventualmente, per il verso, mentre le loro direzioni restano invariate.__

In altri termini, supponendo che \\( A \\) sia una matrice \\( 2 \times 2 \\) di righe linearmente indipendenti, ovvero un endomorfismo in \\( \mathbb{R}^2 \\), allora esiste qualche coppia \\( (x, y) \ne (0, 0) \\) che, trasformata mediante \\( A \\), dia come risultato ancora la coppia \\( (x, y) \\) moltiplicata per \\( \lambda \\) ovvero:

$$ A(x, y) = \lambda(x, y) \\)

I rispettivi coefficienti \\( \lamba \\) degli autovettori prendono il nome di __autovalori__. In caso di \\( \lambda \\) positivo, il rispettivo vettore trasformato non subisce un cambiamento di verso; specularmente, quando negativo, il verso ne risulterà opposto. Ma, sia come sia, la direzione individuata dagli autovettori non cambia.
