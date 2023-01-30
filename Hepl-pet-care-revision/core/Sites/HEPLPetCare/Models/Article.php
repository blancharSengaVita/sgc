<?php

namespace SGBD\Sites\HEPLPetCare\Models;

use SGBD\BaseModel;

class Article extends BaseModel
{
    public function homepageArticles($connexion)
    {
        return $connexion->prepare('SELECT 
	p.`src`,
	p.`type`,
	p.`title`,
	p.`slug`,
	p.`content`,
	p.`published_at`
FROM `posts` p 
WHERE p.`deleted_at` IS NULL;');
    }
}