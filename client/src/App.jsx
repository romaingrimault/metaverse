import React from "react";
import { Canvas, useLoader } from "@react-three/fiber";
import { Plane, OrbitControls } from "@react-three/drei";
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';

const ModelMaison = () => {
  const gltf = useLoader(GLTFLoader, process.env.PUBLIC_URL + "/house.glb");
  return <primitive object={gltf.scene} position={[3, -0.5, 3]} scale={1} />;
};

function App() {
	return (
    <div style={{ display: "flex", justifyContent: "center", alignItems: "center", height: "100vh" }}>
      <Canvas>
        <OrbitControls />

        <ambientLight intensity={3} />

        <spotLight position={[10, 10, 10]} angle={0.20} penumbra={1} />

        <pointLight position={[0, 10, 0]} />

        <Plane args={[100, 100]} position={[0, 0, 0]} rotation={[-0.5 * Math.PI, 0, 0]}>
          <meshStandardMaterial color={"#999999"} />
        </Plane>

        <ModelMaison />

      </Canvas>
    </div>
  );
}

export default App;