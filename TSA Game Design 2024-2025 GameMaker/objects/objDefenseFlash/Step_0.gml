image_alpha -= 0.2;  // Fade out effect
life--;

if (life <= 0) {
    instance_destroy();  // Destroy after life runs out
}
