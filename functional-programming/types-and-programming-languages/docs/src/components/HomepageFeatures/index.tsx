import type { ReactNode } from 'react';
import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  location: string;
  description: ReactNode;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Compilers',
    location: "/img/llvm.png",
    description: (
      <>
        I've always had an interest in <a href="https://en.wikipedia.org/wiki/Compiler">compilers</a>. I'm currently working on a compiler for a new programming language called <a href="https://github.com/GD0C/language-spec">GD0C</a>.
      </>
    ),
  },
  {
    title: 'Programing Languages',
    location: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Racket-logo.svg/1200px-Racket-logo.svg.png",
    description: (
      <>
        Currently, a part of my passion within the CS field is with Programming Languages. I'm actively
        trying to participate in the <a href="">NEU Programming Language</a> lab.
      </>
    ),
  },
  {
    title: 'Typed Systems',
    location: "https://upload.wikimedia.org/wikipedia/en/4/4d/Knights_of_the_Lambda_Calculus.svg",
    description: (
      <>
        Extend or customize your website layout by reusing React. Docusaurus can
        be extended while reusing the same header and footer.
      </>
    ),
  },
];


function Feature({ title, location, description }: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <img src={location} className={styles.featureSvg} />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactNode {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
