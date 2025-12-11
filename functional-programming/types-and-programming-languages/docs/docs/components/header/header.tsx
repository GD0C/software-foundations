import React from 'react';
import { HeaderProps } from '../interfaces';

export const Header: React.FC<HeaderProps> = ({ header_text }) => {
  return (
    <div className="header">
      {header_text}
    </div>
  )
}

export default Header;
