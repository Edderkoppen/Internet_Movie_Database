<?php

namespace controller;

class QuerieController
{
    public function __construct(){}
    public function selectQuerie($data, $from){
        return "select " . $data . " from " . $from . ";";
    }

    public function test($data){ ?>
        <section id="last">
        <h2 class="titre">Derniers films</h2>
        <a class="plus" href="#"> Voir plus</a>
        <ul class="alignement">

        <?php foreach ($data as $donnee) { ?>
            <li class="item-1">
                <div class="last-box">
                    <div class="last-img-1">
                        <div class="qualite">HDRip</div>
                        <?php echo "<img src=\"../" . $donnee['image_path'] . "\" alt=\"affiche " . $donnee["titre"] . "\" >"; ?>
                    </div>

                    <div class="last-txt-1">
                        <strong><?php echo $donnee['titre']; ?></strong>
                        <p><?php echo $donnee['prix'] . "€"; ?></p>
                    </div>
                </div>
            </li>
        <?php } ?>

        </ul>
    </section>
    <?php }

} ?>