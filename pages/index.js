import Image from "next/image";

export default function Index() {
  return (
    <div>
      <Image src="/logo.png" alt="logo" width={22} height={22} />
      &nbsp;
      Welcome to Abeer Labs!
    </div>
  );
}
