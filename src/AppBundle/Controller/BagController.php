<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Session\Attribute;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Item;
use AppBundle\Entity\Category;

/**
 * Item Controller
 * @Route("/checkout")
 */
class BagController extends Controller
{
    /**
     * @Route("/", name="myBag")
     */
    public function bagAction(Request $request)
    {
        $session = $request->getSession();
        if (!$session->has('myBag')) $session->set('myBag', array());

        $em = $this->getDoctrine()->getManager();
        $items = $em->getRepository('AppBundle:Item')->findArray(array_keys($session->get('myBag')));

        return $this->render('AppBundle:Bag:bag.html.twig', array(
            'myBag'=>$session->get('myBag'),
            'items'=>$items,
        ));
    }

    /**
     * @Route("/add/{id}", name="addToBag")
     */
    public function addAction($id, Request $request)
    {
        $session = $request->getSession();

        if (!$session->has('myBag')) $session->set('myBag', array());
        $myBag = $session->get('myBag');

        if (array_key_exists($id, $myBag)) {
            if ($request->query->get('qte') != null)
                $myBag['$id'] = $request->query->get('qte');
        }else{
            if ($request->query->get('qte') != null)
                $myBag[$id] = $request->query->get('qte');
            else
                $myBag[$id] = 1;
        }

        $session->set('myBag', $myBag);

        return $this->redirectToRoute("myBag");
    }

    /**
     * @Route("/delete/{id}", name="deleteToBag")
     */
    public function deleteAction($id, Request $request)
    {
        $session = $request->getSession();

        $myBag = $session->get('myBag');

        if (array_key_exists($id, $myBag))
        {
            unset($myBag[$id]);
            $session->set('myBag',$myBag);
            $this->get('session')->getFlashBag()->add('success','Article supprimé avec succès de votre panier');
        }
        return $this->redirectToRoute("myBag");
    }

}