import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    // Position the flash message below any existing flash messages
    this.positionFlash()

    // Add close button
    const closeButton = document.createElement("button")
    closeButton.innerHTML = "×"
    closeButton.classList.add("ml-4", "font-bold", "text-lg")
    closeButton.addEventListener("click", () => this.dismiss())
    this.element.appendChild(closeButton)

    // Auto-dismiss after 5 seconds
    setTimeout(() => {
      this.dismiss()
    }, 5000)
  }

  positionFlash() {
    // Get all existing flash messages
    const flashMessages = document.querySelectorAll('.flash-message')

    // Start with top position
    let topPosition = 16 // 4rem = 16px

    // For each existing flash message (except the current one), add its height + margin
    flashMessages.forEach(flash => {
      if (flash !== this.element && flash.offsetHeight > 0) {
        topPosition += flash.offsetHeight + 16 // Add height + 16px margin
      }
    })

    // Set the top position for this flash message
    this.element.style.top = `${topPosition}px`
  }

  dismiss() {
    // Fade out
    this.element.classList.add("opacity-0")

    // Remove from DOM after animation completes
    setTimeout(() => {
      this.element.remove()

      // Reposition remaining flash messages
      this.repositionRemainingFlashes()
    }, 500)
  }

  repositionRemainingFlashes() {
    // Get all remaining flash messages
    const flashMessages = document.querySelectorAll('.flash-message')

    // Start with top position
    let topPosition = 16 // 4rem = 16px

    // Reposition each flash message
    flashMessages.forEach(flash => {
      if (flash.offsetHeight > 0) {
        flash.style.top = `${topPosition}px`
        topPosition += flash.offsetHeight + 16 // Add height + 16px margin
      }
    })
  }
}
