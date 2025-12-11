import React from 'react';

interface LegendCardProps {
  children: React.ReactNode;
}

const MainLegendCard: React.FC<LegendCardProps> = ({ children }) => {
  return (
    <div style={{
      padding: "32px",
      backgroundColor: "blue",
      borderRadius: "16px",
      boxShadow: "0 0 8px rgba(0, 0, 0, 0.3)",
      border: "2px solid red",
      borderColor: "red",
      color: "white",
    }}>


      {children}

      <div className="mt-4 bg-yellow-400 p-2 text-black rounded">
        Test Tailwind Classes
      </div>
    </div>
  )
}

export default MainLegendCard;
