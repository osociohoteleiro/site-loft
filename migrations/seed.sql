-- Conteúdo inicial (placeholder genérico). Re-executável: limpa e re-insere.

-- ---------- Settings (JSON) ----------
INSERT OR REPLACE INTO settings (key, value) VALUES
('general', json('{
  "siteName": "Loft Hotel Boutique",
  "logoText": "LOFT",
  "logoSubtext": "HOTEL BOUTIQUE",
  "location": "Sua Cidade - UF",
  "instagramHandle": "@lofthotelboutique"
}')),
('hero', json('{
  "mode": "image",
  "imageUrl": "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=2000&q=80",
  "videoUrl": "https://cdn.coverr.co/videos/coverr-tropical-resort-pool-2633/1080p.mp4",
  "badge": "o melhor preço garantido",
  "title": "Sua Casa no Paraíso",
  "subtitle": "Hospedagem aconchegante e sofisticada para momentos inesquecíveis.",
  "showBooking": true
}')),
('about', json('{
  "eyebrow": "LAZER E SPA",
  "title": "O LOFT HOTEL BOUTIQUE É A HOSPEDAGEM IDEAL PARA DIAS ACONCHEGANTES",
  "paragraphs": [
    "Imerso em um cenário de tranquilidade, a poucos passos das principais atrações, o Loft Hotel Boutique oferece o aconchego que você precisa para se sentir em casa quando estiver viajando.",
    "Nosso Hotel Boutique é a opção ideal para casais em lua de mel ou em comemorações especiais, para famílias com crianças ou para uma turma de amigos. Com área de lazer impecável, restaurante, SPA e um excelente atendimento.",
    "Aconchego, charme e gastronomia regional impecável é só o início do que você encontrará por aqui!"
  ],
  "ctaLabel": "FAÇA UMA RESERVA",
  "ctaUrl": "#reservar",
  "ctaNote": "O MELHOR PREÇO GARANTIDO.",
  "images": [
    "https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=900&q=80",
    "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=900&q=80",
    "https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=900&q=80"
  ]
}')),
('highlightsSection', json('{ "title": "Sua Casa no Paraíso" }')),
('amenitiesSection', json('{ "title": "TUDO PARA SEU CONFORTO" }')),
('roomsSection', json('{ "eyebrow": "INFRAESTRUTURA", "title": "NOSSAS ACOMODAÇÕES" }')),
('location', json('{
  "eyebrow": "ONDE ESTAMOS",
  "title": "UM DESTINO INESQUECÍVEL!",
  "paragraphs": [
    "O Loft Hotel Boutique está em uma ótima localização, pertinho das principais atrações do destino.",
    "Suas paisagens, cercadas pela natureza exuberante, são um convite à contemplação e à aventura. A região oferece uma atmosfera descontraída, enriquecida pela rica cultura local e pela deliciosa gastronomia."
  ],
  "image": "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1200&q=80",
  "ctaLabel": "FAÇA UMA RESERVA",
  "ctaUrl": "#reservar"
}')),
('testimonialsSection', json('{ "title": "O QUE DIZEM NOSSOS HÓSPEDES" }')),
('gallerySection', json('{ "title": "SIGA-NOS NO INSTAGRAM" }')),
('promo', json('{
  "title": "CONHEÇA NOSSAS PROMOÇÕES",
  "ctaLabel": "VER PROMOÇÕES",
  "ctaUrl": "#",
  "image": "https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=2000&q=80"
}')),
('contact', json('{
  "cnpj": "00.000.000/0001-00",
  "groupText": "O Loft Hotel Boutique proporciona as melhores experiências de viagem e conforto aos hóspedes e turistas da região.",
  "address": "Avenida Principal, s/n - Centro, Sua Cidade - UF",
  "email": "reservas@lofthotelboutique.com.br",
  "phone": "+55 (00) 0000-0000",
  "whatsapp": "5500000000000",
  "instagram": "https://instagram.com/lofthotelboutique",
  "facebook": "https://facebook.com/lofthotelboutique"
}'));

-- ---------- Highlights ----------
DELETE FROM highlights;
INSERT INTO highlights (title, image_url, sort_order) VALUES
('Pensão completa', 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=700&q=80', 1),
('Lazer', 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=700&q=80', 2),
('Melhor localização da cidade', 'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=700&q=80', 3),
('Avaliação nota máxima', 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=700&q=80', 4);

-- ---------- Amenities ----------
DELETE FROM amenities;
INSERT INTO amenities (icon, label, sort_order) VALUES
('credit-card', 'Parcelamento em até 10x', 1),
('car', 'Estacionamento gratuito', 2),
('child', 'Grátis criança de até 11 anos', 3),
('wifi', 'Wi-Fi gratuito', 4);

-- ---------- Rooms ----------
DELETE FROM rooms;
INSERT INTO rooms (title, subtitle, description, image_url, amenities, sort_order) VALUES
('Suíte Master Luxo', 'Camas | Hidromassagem | Ar-condicionado',
 'Nossa acomodação mais ampla e sofisticada, perfeita para ocasiões especiais e lua de mel.',
 'https://images.unsplash.com/photo-1582719508461-905c673771fd?auto=format&fit=crop&w=1200&q=80',
 json('["Cama King", "Hidromassagem", "Ar-condicionado", "Varanda"]'), 1),
('Suíte Master', 'Cama King | Hidromassagem | Ar-condicionado',
 'Conforto e elegância com amplo espaço e vista privilegiada.',
 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?auto=format&fit=crop&w=1200&q=80',
 json('["Cama King", "Hidromassagem", "Ar-condicionado"]'), 2),
('Quarto Superior', 'Cama Queen | Ar-condicionado',
 'Ambiente acolhedor e bem decorado, ideal para casais.',
 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80',
 json('["Cama Queen", "Ar-condicionado", "Frigobar"]'), 3),
('Quarto Térreo', 'Cama Casal | Acesso facilitado',
 'Praticidade e conforto com acesso direto à área de lazer.',
 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=1200&q=80',
 json('["Cama Casal", "Ar-condicionado", "Acesso facilitado"]'), 4);

-- ---------- Testimonials ----------
DELETE FROM testimonials;
INSERT INTO testimonials (title, quote, author, rating, sort_order) VALUES
('Um ótimo local para se hospedar!',
 'Tudo muito bem organizado, um atendimento super agradável, um café da manhã farto e variado. Muito bem localizado, quartos confortáveis e limpos, com uma ótima estrutura de apoio: piscina, spa, jogos, academia.',
 'R.M.', 5, 1),
('Hospedagem incrível!',
 'Ótima hospedagem, funcionários atenciosos, comidas saborosas e café da manhã delicioso. O SPA é bem relaxante, com ótimos profissionais. Quarto aconchegante e sempre limpinho! Recomendamos de olhos fechados.',
 'K.M.', 5, 2),
('Férias deliciosas',
 'Local muito bonito e de bom gosto, ótima localização. Após um dia de passeio, um descanso na piscina conversando com outro hóspede. Pessoal muito gentil e educado. Quarto confortável e limpo.',
 'S.N.', 5, 3);

-- ---------- Gallery ----------
DELETE FROM gallery;
INSERT INTO gallery (image_url, caption, sort_order) VALUES
('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?auto=format&fit=crop&w=700&q=80', 'Gastronomia', 1),
('https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=700&q=80', 'Suíte', 2),
('https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?auto=format&fit=crop&w=700&q=80', 'Café da manhã', 3),
('https://images.unsplash.com/photo-1445019980597-93fa8acb246c?auto=format&fit=crop&w=700&q=80', 'Buffet', 4);
