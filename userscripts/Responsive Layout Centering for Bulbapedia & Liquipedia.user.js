// ==UserScript==
// @name         Responsive Layout Centering for Bulbapedia & Liquipedia
// @namespace    http://tampermonkey.net/
// @version      1.2
// @description  Center-aligns content only on wide screens (>1080px) for Bulbapedia and Liquipedia
// @match        https://bulbapedia.bulbagarden.net/*
// @match        https://liquipedia.net/*
// @match        https://*.liquipedia.net/*
// @grant        GM_addStyle
// ==/UserScript==

(function () {
  'use strict';

  function applyLayoutFix() {
    if (window.innerWidth <= 1080) return; // Skip fix for smaller screens

    const css = `
      /* Common centering styles */
      body, .mw-body, .mw-body-content, #content, .main-content, .mw-content-container, .lp-container {
        margin-left: auto !important;
        margin-right: auto !important;
        max-width: 1600px !important;
        padding-left: 24px !important;
        padding-right: 24px !important;
        box-sizing: border-box;
      }

      /* Prevent flex container issues on Liquipedia */
      .lp-container {
        max-width: none !important;
      }
    `;

    if (typeof GM_addStyle !== 'undefined') {
      GM_addStyle(css);
    } else {
      const style = document.createElement('style');
      style.textContent = css;
      document.head.appendChild(style);
    }
  }

  // Run on load
  applyLayoutFix();

  // Optional: Re-run if user resizes window
  window.addEventListener('resize', () => {
    // If crossing threshold, reload styles (simplified for now)
    if (window.innerWidth > 1080 && !document.getElementById('center-fix-style')) {
      applyLayoutFix();
    }
  });
})();
