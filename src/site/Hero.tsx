import type { HeroSettings } from "../lib/types";
import BookingBar from "./BookingBar";

export default function Hero({ hero }: { hero: HeroSettings }) {
  return (
    <section id="home" className="relative h-[88vh] min-h-[560px] w-full">
      {/* Mídia de fundo isolada num container com overflow-hidden, para não
          cortar o card de reservas que se projeta para fora do hero. */}
      <div className="absolute inset-0 overflow-hidden">
        {hero.mode === "video" && hero.videoUrl ? (
          <video
            className="absolute inset-0 h-full w-full object-cover"
            src={hero.videoUrl}
            autoPlay
            loop
            muted
            playsInline
            poster={hero.imageUrl}
          />
        ) : (
          <img
            src={hero.imageUrl}
            alt={hero.title}
            className="absolute inset-0 h-full w-full object-cover"
          />
        )}
        <div className="absolute inset-0 bg-black/30" />
      </div>

      <div className="relative z-10 flex h-full flex-col items-center justify-center px-5 text-center text-white">
        {hero.badge && (
          <p className="eyebrow mb-3 text-white/90 drop-shadow">{hero.badge}</p>
        )}
        <h1 className="font-display text-4xl leading-tight drop-shadow-lg md:text-6xl">
          {hero.title}
        </h1>
        {hero.subtitle && (
          <p className="mt-4 max-w-2xl text-base text-white/90 drop-shadow md:text-lg">
            {hero.subtitle}
          </p>
        )}
      </div>

      {hero.showBooking && (
        <div id="reservar" className="absolute inset-x-0 bottom-0 z-30 flex justify-center px-4">
          <div className="w-full max-w-5xl translate-y-1/2">
            <BookingBar />
          </div>
        </div>
      )}
    </section>
  );
}
