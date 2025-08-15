export default function handler(req, res) {
  res.status(200).json({
    message: "9dac4bcfb74723c0b364",
    timestamp: new Date().toISOString(),
  });
}