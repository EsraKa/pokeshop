<?php
namespace AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Entity\Item;
use AppBundle\Entity\Category;

/**
 * Admin controller.
 *
 * @Route("/admin/")
 */
class AdminController extends Controller
{
    /**
     * @Route("", name="dashboard")
     */
    public function listAction()
    {
        $em = $this->getDoctrine()->getManager();

        $itemRepo = $em->getRepository("AppBundle:Item");
        $items = $itemRepo->findAll();

        $categoryRepo = $em->getRepository("AppBundle:Category");
        $categories = $categoryRepo->findAll();

        return $this->render('AdminBundle:Admin:dashboard.html.twig', array(
            "items" => $items,
            "categories" => $categories
        ));
    }

    /**
     * @Route("add/item", name="addItem")
     */
    public function addItemAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $form = $this->createFormBuilder(new Item())
            ->add("name")
            ->add("price")
            ->add("image")
            ->add('height')
            ->add('weight')
            ->add('color')
            ->add("details")
            ->add("submit", SubmitType::class, array('label' => 'Ajouter'))
            ->getForm();

        $form->handleRequest($request);


        if($form->isSubmitted()) {
            $item = $form->getData();
            $em->persist($item);
            $em->flush();

            return $this->redirectToRoute("dashboard");
        }

        return $this->render('AdminBundle:Item:add.html.twig', array(
            'form' => $form->createView()
        ));

    }
    /**
     * @Route("add/category", name="addCategory")
     */
    public function addCategoryAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $form = $this->createFormBuilder(new Category())
            ->add("name")
            ->add("submit", SubmitType::class, array('label' => 'Add'))
            ->getForm();

        $form->handleRequest($request);


        if($form->isSubmitted()) {
            $category = $form->getData();
            $em->persist($category);
            $em->flush();

            return $this->redirectToRoute("dashboard");
        }

        return $this->render('AdminBundle:Category:add.html.twig', array(
            'form' => $form->createView()
        ));
    }

    /**
     * @Route("edit/item/{id}", name="editItem")
     */
    public function editItemAction($id, Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $item = $em->getRepository('AppBundle:Item')->find($id);
        if (!$item) {
            throw $this->createNotFoundException(
                'No news found for id ' . $id
            );
        }

        $form = $this->createFormBuilder($item)
            ->add('name')
            ->add('price')
            ->add('image')
            ->add('height')
            ->add('weight')
            ->add('color')
            ->add('category')
            ->add('details')
            ->add("submit", SubmitType::class, array('label' => 'Save'))
            ->getForm();

        $form->handleRequest($request);

        if ($form->isValid()) {
            $em->flush();
            return new Response('News updated successfully');
        }

        $build['form'] = $form->createView();

        return $this->redirectToRoute("dashboard", $build);
    }

    /**
     * @Route("delete/item/{id}", name="deleteItem")
     */
    public function deleteItemAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $itemRepo = $em->getRepository("AppBundle:Item");
        $item = $itemRepo->find($id);
        $em->remove($item);
        $em->flush();

        return $this->redirectToRoute("dashboard");
    }

    /**
     * @Route("/delete/category/{id}", name="deleteCategory")
     */
    public function deleteCategoryAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $categoryRepo = $em->getRepository("AppBundle:Category");
        $category = $categoryRepo->find($id);
        $em->remove($category);
        $em->flush();

        return $this->redirectToRoute("dashboard");
    }



}