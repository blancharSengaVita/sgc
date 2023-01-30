<?php

/*
 *  Modifiez ce fichier afin d'y injecter les résultats de la requête
 *  que vous avez rédigée dans le fichier <groupe>-<nom>-<prenom>.sql.
 *
 *  --
 *  INFORMATIONS IMPORTANTES :
 *      - Cette vue n'accède qu'à une seule variable PHP qui a été définie pour vous :
 *        $results - Un tableau contenant les résultats de votre requête SQL
 *      - Tout ce qu'il faut modifier se trouve dans div.list__items
 *      - Faites bien attention à tous les détails prévus dans la structure HTML ci-dessous
 *      - Tenez à l'esprit que certaines colonnes "nullables" de la base de données pourraient
 *        ne nécessiter un contrôle particulier à l'affichage, au cas où elles seraient NULL.
 *      - Deux fonctions spéciales PHP sont utilisées :
 *          1. date('d/m/Y', strtotime($maDate))
 *             Permet de formater une date au format SQL stockée dans une variable $maDate de
 *             façon à ce qu'elle s'affiche par exemple ainsi : 21/01/2022.
 *          2. date('c', strtotime($maDate))
 *             Permet de formater une date au format SQL stockée dans une variable $maDate de
 *             façon à ce qu'elle s'affiche au format ISO 8601, par exemple ainsi : 2022-01-21T10:30:00
 *          3. number_format($number, $decimals_count, $decimals_separator, $thousands_separator)
 *             Retourne un nombre donné au format souhaité
 *              - $number - représente le nombre "brut" à formater
 *              - $decimals_count - représente le nombre de décimales après la virgule
 *              - $decimals_separator - représente le caractère à utiliser en tant que "virgule"
 *              - $thousands_separator - représente le caractère à utiliser entre les milliers
 *  --
 *
 *  Renommez ce fichier comme il se doit (<groupe>-<nom>-<prenom>.php).
 *  N'ayez crainte, le système MVC a été adapté et continuera à 
 *  fonctionner malgré le renommage.
 */

?><!DOCTYPE html>
<html lang="fr-BE">
<head>
    <meta charset="UTF-8">
    <title>Top 10 - HEPLflix</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="head">
        <div class="head__container wrapper">
            <h1 class="head__title">
                <span class="sro">HEPLflix -</span>
                <strong class="head__big">Le top 3</strong>
                <em class="head__sub">Des séries disponibles en anglais</em>
            </h1>
        </div>
        <div class="head__top">
            <div class="head__bar wrapper">
                <div class="head__branding">
                    <a href="#" class="head__home">Retour à l'accueil</a>
                    <img src="img/logo.svg" alt="Logo de HEPLflix" class="head__logo" />
                </div>
                <nav class="head__nav nav">
                    <h2 class="sro">Navigation principale</h2>
                    <a href="#" class="nav__item"><span class="nav__label">Accueil</span></a>
                    <a href="#" class="nav__item"><span class="nav__label">Films</span></a>
                    <a href="#" class="nav__item"><span class="nav__label">Séries</span></a>
                    <a href="#" class="nav__item nav__item--current"><span class="nav__label">Top 3</span></a>
                    <a href="#" class="nav__item"><span class="nav__label">Se connecter</span></a>
                </nav>
            </div>
        </div>
    </header>
    <main class="list">
        <section class="list__container wrapper">
            <h2 class="sro">Actuellement dans le Top 3</h2>
            <div class="list__items">
                <?php foreach($results as $show): ?>
                <article class="track">
                    <header class="track__head">
                        <h3 class="track__title">
                            <?php if($show->url) : ?>
                                <a href="<?= $show->url; ?>" class="track__link" target="_blank"><?= $show->title; ?></a>
                            <?php else : ?>
                                <?= $show->title; ?>
                            <?php endif; ?>
                        </h3>
                        <?php if($show->tagline) : ?>
                        <p class="track__tagline"><?= $show->tagline; ?></p>
                        <?php endif; ?>
                        <dl class="track__meta">
                            <dt class="track__term">Nombre de saisons</dt>
                            <dd class="track__data"><?= $show->seasons; ?></dd>
                            <dt class="track__term">Sortie</dt>
                            <dd class="track__data"><time datetime="<?= date('c', strtotime($show->released_at)); ?>"><?= date('d/m/Y', strtotime($show->released_at)); ?></time></dd>
                            <dt class="track__term">Fin</dt>
                            <dd class="track__data"><time datetime="<?= date('c', strtotime($show->latest)); ?>"><?= date('d/m/Y', strtotime($show->latest)); ?></time></dd>
                        </dl>
                        <div class="track__description">
                            <?php if($show->description) : ?>
                                <p><?= $show->description; ?></p>
                            <?php endif; ?>
                        </div>
                    </header>
                    <div class="track__player">
                        <button class="track__play"><span class="sro">Regarder "<?= $show->title; ?>"</span></button>
                        <figure class="track__cover">
                            <img src="img/thumbs/<?= $show->img; ?>" alt="Image de couverture de <?= $show->title; ?>" class="track__img">
                        </figure>
                    </div>
                    <div class="track__appreciation"><div class="track__rating">
                        <strong class="track__rate"><?= number_format($show->score, 2, ',', ' '); ?></strong>
                        <span class="track__mode">Moyenne pour</span>
                        <em class="track__count"><?= $show->episodes; ?> épisodes</em>
                    </div></div>
                </article>
                <?php endforeach; ?>
            </div>
        </section>
    </main>
    <footer class="disclaimer wrapper">
        <p class="disclaimer__content">HEPLflix - Examen Janvier 2022 - Systèmes de Gestion de Contenu (SGC)</p>
    </footer>
</body>
</html>