import React from 'react';
import { LegendCardProps } from '../interfaces/';
import { Header } from '../header';


const MainLegendCard: React.FC<LegendCardProps> = ({ children, title }) => {
  return (
    <div className="legend-card">
      <Header header_text={title} />
      {children}

      <div className="mt-4 bg-yellow-400 p-2 text-black rounded">
        Test Tailwind Classes
      </div>
    </div>
  )
}

export default MainLegendCard;
