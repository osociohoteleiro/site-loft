import { useState } from "react";

function todayISO(offsetDays = 0) {
  const d = new Date();
  d.setDate(d.getDate() + offsetDays);
  return d.toISOString().slice(0, 10);
}

function formatBR(iso: string) {
  if (!iso) return "";
  const [y, m, d] = iso.split("-");
  return `${d}/${m}/${y}`;
}

export default function BookingBar() {
  const [checkin, setCheckin] = useState(todayISO(0));
  const [checkout, setCheckout] = useState(todayISO(1));
  const [guests, setGuests] = useState("1 Adulto");

  return (
    <div className="w-full max-w-5xl rounded-md bg-white shadow-xl ring-1 ring-black/5">
      <div className="grid grid-cols-2 items-center gap-px md:grid-cols-[auto_1fr_1fr_1fr_auto]">
        <div className="px-6 py-4 text-center text-ink md:text-left">
          <p className="font-display text-sm leading-tight text-ink">
            o melhor
            <br /> preço
            <br /> garantido
          </p>
        </div>

        <Field label="check-in">
          <DateInput value={checkin} onChange={setCheckin} />
        </Field>
        <Field label="check-out">
          <DateInput value={checkout} onChange={setCheckout} />
        </Field>

        <Field label="hóspedes">
          <select
            value={guests}
            onChange={(e) => setGuests(e.target.value)}
            className="w-full bg-transparent font-display text-xl text-ink outline-none"
          >
            <option>1 Adulto</option>
            <option>2 Adultos</option>
            <option>2 Adultos, 1 Criança</option>
            <option>2 Adultos, 2 Crianças</option>
            <option>3 Adultos</option>
            <option>4 Adultos</option>
          </select>
        </Field>

        <div className="col-span-2 p-3 md:col-span-1">
          <a
            href="#reservar"
            className="block rounded border border-brand px-8 py-4 text-center font-medium tracking-widest text-brand transition hover:bg-brand hover:text-white"
          >
            RESERVAR
          </a>
        </div>
      </div>
    </div>
  );
}

function Field({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="border-l border-gray-200 px-6 py-3 first:border-l-0">
      <p className="mb-1 text-xs text-gray-500">{label}</p>
      {children}
    </div>
  );
}

function DateInput({ value, onChange }: { value: string; onChange: (v: string) => void }) {
  return (
    <label className="relative block cursor-pointer">
      <span className="font-display text-xl text-ink">{formatBR(value)}</span>
      <input
        type="date"
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className="absolute inset-0 cursor-pointer opacity-0"
      />
    </label>
  );
}
