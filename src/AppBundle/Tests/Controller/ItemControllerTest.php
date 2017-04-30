<?php

namespace AppBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ItemControllerTest extends WebTestCase
{
    public function testAll()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/items');
    }

    public function testDetail()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/item/{id}');
    }

}
