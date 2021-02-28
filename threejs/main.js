const THREE = require('three');
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera( 75
  ,window.innerWidth/window.innerHeight, 0.1, 1000 );
const renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );

document.body.appendChild( renderer.domElement );

camera.position.z = 5;

const GLTFLoader = require('./gltf-loader');
// import {GLTFLoader} from
// 'three/examples/jsm/loaders/GLTFLoader.js';

const loader = new GLTFLoader();

loader.load('data/BoomBox.glb', function(gltf) {
    scene.add ( gltf.scene );
  }, undefined, function (error) {
    console.error( error );
  }
);

const animate = function () {
  requestAnimationFrame(animate);

  renderer.render( scene, camera );  
}

animate();


