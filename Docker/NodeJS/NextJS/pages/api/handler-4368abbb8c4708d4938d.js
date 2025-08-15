export default function handler(req, res) {
  res.status(200).json({
    message: "4368abbb8c4708d4938d",
    timestamp: new Date().toISOString(),
  });
}
