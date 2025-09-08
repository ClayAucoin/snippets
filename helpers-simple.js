/**
 * helpers-simple.js
 * A minimal helper library for HTML/JS projects.
 * 
 * Note: This version has no logging or error checks. 
 * Use only as a learning example.
 */

/**
 * Attach an event listener to a UI element.
 * @param {string} id - The id of the element.
 * @param {string} event - The event type (e.g. "click").
 * @param {Function} handler - The function to run on the event.
 */
function onEvent(id, event, handler) {
    var el = document.getElementById(id);
    el.addEventListener(event, handler);
  }
  
  /**
   * Change a CSS property of an element.
   * @param {string} id - The id of the element.
   * @param {string} property - CSS property (e.g. "color", "backgroundColor").
   * @param {string|number} value - The new value.
   */
  function setProperty(id, property, value) {
    var el = document.getElementById(id);
    el.style[property] = value;
  }
  
  /**
   * Play a sound from a given URL.
   * @param {string} url - The sound file URL.
   * @param {boolean} [loop=false] - Whether to loop the sound.
   */
  function playSound(url, loop) {
    var audio = new Audio(url);
    audio.loop = loop || false;
    audio.play();
  }
  
  /**
   * Change the text of an element.
   * @param {string} id - The id of the element.
   * @param {string} text - The text to display.
   */
  function setText(id, text) {
    var el = document.getElementById(id);
    el.textContent = text;
  }
  
  /**
   * Get the text from an element.
   * @param {string} id - The id of the element.
   * @returns {string} The element's text.
   */
  function getText(id) {
    var el = document.getElementById(id);
    return el.textContent;
  }
  
  /**
   * Set the value of an input element.
   * @param {string} id - The id of the input.
   * @param {string} value - The value to set.
   */
  function setValue(id, value) {
    var el = document.getElementById(id);
    el.value = value;
  }
  
  /**
   * Get the value of an input element.
   * @param {string} id - The id of the input.
   * @returns {string} The input's value.
   */
  function getValue(id) {
    var el = document.getElementById(id);
    return el.value;
  }
  
  /**
   * Set the URL of an existing image element.
   * @param {string} id - The id of the image element.
   * @param {string} url - The image URL.
   */
  function setImageURL(id, url) {
    var el = document.getElementById(id);
    el.src = url;
  }
  