<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;


/**
 * Item Controller
 * @Route("/item")
 */
class ItemController extends Controller
{
    /**
     * @Route("/", name="allItems")
     */
    public function allAction()
    {
        $em = $this->getDoctrine()->getManager();

        $itemRepo = $em->getRepository("AppBundle:Item");
        $items = $itemRepo->findAll();

        $categoryRepo = $em->getRepository("AppBundle:Category");
        $categories = $categoryRepo->findAll();

        return $this->render('AppBundle:Item:all.html.twig', array(
            'items' => $items,
            'categories' => $categories
        ));
    }

    /**
     * @Route("/{id}", name="detailItem")
     */
    public function detailAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $itemRepo = $em->getRepository("AppBundle:Item");
        $item = $itemRepo->find($id);

        $categoryRepo = $em->getRepository("AppBundle:Category");
        $categories = $categoryRepo->findAll();

        $itemRepo = $em->getRepository("AppBundle:Item");
        $items = $itemRepo->findAll();

        return $this->render('AppBundle:Item:detail.html.twig', array(
            'item' => $item,
            'categories' => $categories,
            'items'=> $items
        ));

    }

}
